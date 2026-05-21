#!/usr/bin/env python3
"""
Script de validation pour le vocabulaire DPP conforme aux recommandations LOV
Remplace l'outil Vapour qui n'est plus disponible
"""

import sys
import rdflib
from rdflib import RDF, OWL, RDFS, Namespace
from rdflib.namespace import DCTERMS, DC
from urllib.parse import urlparse

# Namespaces LOV
VOAF = Namespace("http://purl.org/vocommons/voaf#")
VANN = Namespace("http://purl.org/vocab/vann/")
VS = Namespace("http://www.w3.org/2003/06/sw-vocab-status/ns#")
CC = Namespace("http://creativecommons.org/ns#")
FOAF = Namespace("http://xmlns.com/foaf/0.1/")

def validate_rdf_syntax(file_path):
    """Valide la syntaxe RDF/Turtle"""
    print("📋 Validation de la syntaxe RDF/Turtle...")
    try:
        g = rdflib.Graph()
        g.parse(file_path, format='turtle')
        print(f"   ✅ Syntaxe valide : {len(g)} triplets parsés")
        return g, True
    except Exception as e:
        print(f"   ❌ Erreur de syntaxe : {e}")
        return None, False

def validate_owl_structure(g):
    """Valide la structure OWL"""
    print("\n📋 Validation de la structure OWL...")
    issues = []
    
    # Vérifier que c'est une Ontology
    ontology_uri = rdflib.URIRef("https://ns.verisav.fr/dpp#")
    if not (ontology_uri, RDF.type, OWL.Ontology) in g:
        issues.append("❌ L'ontologie n'est pas déclarée comme owl:Ontology")
    else:
        print("   ✅ Ontologie déclarée correctement")
    
    # Vérifier les classes
    classes = list(g.subjects(RDF.type, OWL.Class))
    print(f"   ✅ {len(classes)} classes OWL trouvées")
    
    # Vérifier les propriétés
    object_props = list(g.subjects(RDF.type, OWL.ObjectProperty))
    datatype_props = list(g.subjects(RDF.type, OWL.DatatypeProperty))
    print(f"   ✅ {len(object_props)} propriétés objet")
    print(f"   ✅ {len(datatype_props)} propriétés de données")
    
    # Vérifier les domaines et gammes
    props_with_domain = set()
    props_with_range = set()
    for prop in list(object_props) + list(datatype_props):
        domains = list(g.objects(prop, RDFS.domain))
        ranges = list(g.objects(prop, RDFS.range))
        if domains:
            props_with_domain.add(prop)
        if ranges:
            props_with_range.add(prop)
    
    if len(props_with_domain) < len(object_props) + len(datatype_props) * 0.8:
        issues.append(f"⚠️  Seulement {len(props_with_domain)}/{len(object_props) + len(datatype_props)} propriétés ont un domaine défini")
    else:
        print(f"   ✅ {len(props_with_domain)} propriétés avec domaine défini")
    
    return len(issues) == 0, issues

def validate_lov_metadata(g):
    """Valide la présence des métadonnées LOV recommandées"""
    print("\n📋 Validation des métadonnées LOV...")
    ontology_uri = rdflib.URIRef("https://ns.verisav.fr/dpp#")
    
    # Vérifier title (dc:title ou dcterms:title)
    has_title = len(list(g.objects(ontology_uri, DC.title))) > 0 or len(list(g.objects(ontology_uri, DCTERMS.title))) > 0
    # Vérifier description (dc:description ou dcterms:description)
    has_description = len(list(g.objects(ontology_uri, DC.description))) > 0 or len(list(g.objects(ontology_uri, DCTERMS.description))) > 0
    # Vérifier issued/created (dcterms:issued ou dcterms:created)
    has_issued = len(list(g.objects(ontology_uri, DCTERMS.issued))) > 0 or len(list(g.objects(ontology_uri, DCTERMS.created))) > 0
    # Vérifier creator (dc:creator ou dcterms:creator)
    has_creator = len(list(g.objects(ontology_uri, DC.creator))) > 0 or len(list(g.objects(ontology_uri, DCTERMS.creator))) > 0
    
    checks = {
        "voaf:Vocabulary": (ontology_uri, RDF.type, VOAF.Vocabulary) in g,
        "vann:preferredNamespacePrefix": len(list(g.objects(ontology_uri, VANN.preferredNamespacePrefix))) > 0,
        "vann:preferredNamespaceUri": len(list(g.objects(ontology_uri, VANN.preferredNamespaceUri))) > 0,
        "title (dc/dcterms)": has_title,
        "description (dc/dcterms)": has_description,
        "issued/created (dcterms)": has_issued,
        "dcterms:modified": len(list(g.objects(ontology_uri, DCTERMS.modified))) > 0,
        "cc:license": len(list(g.objects(ontology_uri, CC.license))) > 0,
        "creator (dc/dcterms)": has_creator,
    }
    
    all_passed = True
    for check, result in checks.items():
        status = "✅" if result else "❌"
        print(f"   {status} {check}")
        if not result:
            all_passed = False
    
    # Vérifier les éléments avec métadonnées
    elements_with_defined_by = set()
    elements_with_status = set()
    for s, p, o in g:
        if p == RDFS.isDefinedBy and o == ontology_uri:
            elements_with_defined_by.add(s)
        if p == VS.term_status:
            elements_with_status.add(s)
    
    print(f"\n   ✅ {len(elements_with_defined_by)} éléments avec rdfs:isDefinedBy")
    print(f"   ✅ {len(elements_with_status)} éléments avec vs:term_status")
    
    return all_passed, checks

def validate_accessibility(uri):
    """Valide l'accessibilité du vocabulaire via URI"""
    print(f"\n📋 Validation de l'accessibilité URI...")
    print(f"   URI à tester : {uri}")
    print("   ⚠️  Cette vérification nécessite que le vocabulaire soit déployé")
    print("   ℹ️  Testez manuellement avec : curl -I " + uri)
    return True

def main():
    file_path = "dpp.ttl"
    if len(sys.argv) > 1:
        file_path = sys.argv[1]
    
    print("=" * 70)
    print("🔍 VALIDATION DU VOCABULAIRE DPP POUR LOV")
    print("=" * 70)
    print()
    
    # Validation syntaxe
    g, syntax_ok = validate_rdf_syntax(file_path)
    if not syntax_ok:
        print("\n❌ ÉCHEC : Erreur de syntaxe RDF")
        sys.exit(1)
    
    # Validation structure OWL
    owl_ok, owl_issues = validate_owl_structure(g)
    if owl_issues:
        for issue in owl_issues:
            print(f"   {issue}")
    
    # Validation métadonnées LOV
    lov_ok, lov_checks = validate_lov_metadata(g)
    
    # Résumé
    print("\n" + "=" * 70)
    print("📊 RÉSUMÉ DE VALIDATION")
    print("=" * 70)
    print(f"Syntaxe RDF/Turtle : {'✅ VALIDE' if syntax_ok else '❌ INVALIDE'}")
    print(f"Structure OWL : {'✅ VALIDE' if owl_ok else '⚠️  AVERTISSEMENTS'}")
    print(f"Métadonnées LOV : {'✅ COMPLÈTES' if lov_ok else '❌ MANQUANTES'}")
    
    if syntax_ok and owl_ok and lov_ok:
        print("\n✅ VOCABULAIRE PRÊT POUR SOUMISSION À LOV")
        print("=" * 70)
        print("\n📝 Prochaines étapes :")
        print("   1. Déployer le vocabulaire sur https://ns.verisav.fr/dpp")
        print("   2. Vérifier l'accessibilité avec : curl -I https://ns.verisav.fr/dpp")
        print("   3. Soumettre à LOV via : lov-contact@lists.inria.fr")
        return 0
    else:
        print("\n⚠️  CORRECTIONS NÉCESSAIRES AVANT SOUMISSION")
        print("=" * 70)
        return 1

if __name__ == "__main__":
    sys.exit(main())

