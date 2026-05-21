# Guide de Soumission au Linked Open Vocabularies (LOV)

## ✅ Conformité aux Recommandations LOV

Votre vocabulaire DPP a été enrichi pour respecter les [métadonnées recommandées par LOV](https://lov.linkeddata.es/dataset/lov) (version 1.1, 2012-08-19).

### Métadonnées Implémentées

#### Identification
- ✅ `voaf:Vocabulary` - Type de ressource pour décrire le vocabulaire
- ✅ `vann:preferredNamespacePrefix` - Préfixe "dpp"
- ✅ `vann:preferredNamespaceUri` - URI du namespace

#### Titre et Description
- ✅ `dc:title` - Titre principal (multilingue : en, fr)
- ✅ `dc:description` - Description détaillée (multilingue)
- ✅ `rdfs:label` - Label générique (multilingue)
- ✅ `rdfs:comment` - Commentaires (multilingue)

#### Version et Modification
- ✅ `dcterms:issued` - Date de publication initiale
- ✅ `dcterms:created` - Date de création
- ✅ `dcterms:modified` - Date de dernière modification
- ✅ `owl:versionInfo` - Version actuelle (1.0.0)
- ✅ `rdfs:comment` - Informations sur les changements

#### Droits et Propriété
- ✅ `dc:rights` - Droits d'auteur
- ✅ `cc:license` - Licence Creative Commons BY 4.0
- ✅ `dc:creator` - Créateur (Verisav)
- ✅ `dc:publisher` - Éditeur (Verisav SAS)

#### Métadonnées des Éléments
- ✅ `rdfs:isDefinedBy` - Lien explicite entre un élément et son namespace
- ✅ `vs:term_status` - Statut des termes ("stable")

## 📝 Fichiers Disponibles

- **dpp.ttl** - Vocabulaire en format Turtle/OWL
- **dpp.xml** - Vocabulaire en format RDF/XML
- **dpp.jsonld** - Context JSON-LD pour utilisation dans JSON
- **index.html** - Documentation HTML lisible par les humains

## 🌐 Content Negotiation

Votre vocabulaire supporte la négociation de contenu :
- URI de base : `https://ns.verisav.fr/dpp`
- Format RDF (Accept: application/rdf+xml, text/turtle) → `dpp.ttl` ou `dpp.xml`
- Format HTML (Accept: text/html) → `index.html`

## 📋 Étapes pour Soumettre à LOV

### 1. Vérifier la Disponibilité

Assurez-vous que votre vocabulaire est accessible publiquement :
- ✅ Accessible via HTTPS : `https://ns.verisav.fr/dpp`
- ✅ Content-Type correct pour chaque format
- ✅ CORS activé pour les requêtes cross-origin

### 2. Validation Locale (Recommandé)

Utilisez le script de validation Python inclus :

```bash
cd apps/web/public/vocabularies/dpp
python3 validate_lov.py dpp.ttl
```

Ce script valide :
- ✅ Syntaxe RDF/Turtle
- ✅ Structure OWL
- ✅ Présence des métadonnées LOV requises
- ✅ Cohérence des domaines et gammes

### 2b. Validation en Ligne (Alternatives)

Si vous préférez un validateur en ligne, vous pouvez utiliser :

1. **RDFShape** (recommandé) : https://rdfshape.weso.es/validate
   - Supporte Turtle, RDF/XML, JSON-LD
   - Validation syntaxique et sémantique

2. **SHACL Play!** : https://shacl-play.sparna.fr/play/validate
   - Validation avec SHACL (si vous avez des shapes)

3. **Turtle Editor** : https://www.leskoff.com/s02212-0
   - Éditeur avec validation de syntaxe Turtle

Note: L'outil Vapour (validator.linkeddata.org) n'est plus disponible.

### 3. Soumission LOV

Contactez l'équipe LOV pour soumettre votre vocabulaire :
- **Email** : lov-contact@lists.inria.fr
- **Formulaire** : https://lov.linkeddata.es/dataset/lov/about

Informations à fournir :
- URI du vocabulaire : `https://ns.verisav.fr/dpp`
- Titre : "Verisav Digital Product Passport Vocabulary"
- Description courte : "Vocabulary for Digital Product Passports (DPP) managing product lifecycle, warranties, repairs, and compliance with EU regulations"
- Domaine : IoT, Services, eBusiness
- Licence : CC BY 4.0
- Contact : [votre email]

### 4. Catégories LOV Recommandées

Votre vocabulaire devrait être catégorisé dans :
- **IoT** - Internet of Things (produits connectés)
- **Services** - Service après-vente
- **eBusiness** - Commerce électronique
- **General & Upper** - Vocabulaire général

### 5. Documentation Supplémentaire (Optionnel mais Recommandé)

Pour améliorer votre soumission, vous pouvez ajouter :
- Un diagramme UML/graphique de la structure du vocabulaire
- Des exemples d'utilisation détaillés
- Des cas d'usage concrets
- Un guide d'intégration avec d'autres vocabulaires

## 🔍 Validation Locale

### Script de Validation Complet

Un script Python complet est fourni : `validate_lov.py`

```bash
cd apps/web/public/vocabularies/dpp
python3 validate_lov.py dpp.ttl
```

Le script vérifie automatiquement :
- Syntaxe RDF/Turtle valide
- Structure OWL correcte
- Présence de toutes les métadonnées LOV
- Cohérence des domaines et gammes

### Validation Simple avec rdflib

Vous pouvez aussi valider rapidement avec Python :

```bash
python3 << 'EOF'
import rdflib
g = rdflib.Graph()
g.parse('apps/web/public/vocabularies/dpp/dpp.ttl', format='turtle')
print(f"✅ Vocabulaire valide : {len(g)} triplets")
EOF
```

## 📚 Références

- [LOV Metadata Recommendations v1.1](https://lov.linkeddata.es/dataset/lov)
- [W3C Best Practices for Publishing RDF Vocabularies](https://www.w3.org/TR/swbp-vocab-pub/)
- [RDFShape Validator](https://rdfshape.weso.es/validate)
- [LOV Dataset](https://lov.linkeddata.es/dataset/lov)

## ✅ Checklist Finale

Avant de soumettre, vérifiez :
- [ ] Vocabulaire accessible publiquement
- [ ] Content negotiation fonctionnelle
- [ ] Toutes les métadonnées LOV présentes
- [ ] Validation locale réussie (validate_lov.py)
- [ ] Documentation HTML complète
- [ ] Exemples d'utilisation fournis
- [ ] Licence clairement indiquée

---

**Date de préparation** : 2025-12-16  
**Version du vocabulaire** : 1.0.0  
**Préparé par** : Verisav SAS

