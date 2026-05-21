# Verisav Digital Product Passport (DPP) Vocabulary

Vocabulaire RDF/OWL pour représenter les Passeports Produit Numérique (DPP) conformément aux réglementations européennes 2027.

## 📋 Table des matières

- [Namespace](#namespace)
- [Fichiers](#fichiers)
- [Classes principales](#classes-principales)
- [Propriétés principales](#propriétés-principales)
- [Exemples d'utilisation](#exemples-dutilisation)
- [Enregistrement LOV](#enregistrement-lov)

## 🔗 Namespace

### URI Principale (Verisav)
```
https://ns.verisav.fr/dpp#
```

### URI Persistante W3ID
```
https://w3id.org/verisav/dpp#
```

Les deux URIs sont équivalentes et pointent vers le même vocabulaire. L'URI W3ID fournit une persistance garantie par la W3C.

## 📁 Fichiers

- **`dpp.ttl`** - Fichier OWL/Turtle complet du vocabulaire
- **`dpp.jsonld`** - Context JSON-LD pour faciliter l'utilisation
- **`dpp.xml`** - Sérialisation RDF/XML pour compatibilité outillage entreprise
- **`CHECKSUMS.sha256`** - Empreintes SHA-256 (intégrité des artefacts publiés)
- **`CHANGELOG.md`** - Historique des versions (Added/Changed/Breaking Changes)
- **`validation/dpp.shacl.ttl`** - Règles SHACL de validation sémantique
- **`validation/dpp.schema.json`** - JSON Schema de pré-validation des payloads
- **`index.html`** - Documentation HTML du vocabulaire
- **`README.md`** - Ce fichier

## 🏗️ Classes Principales

### Core Classes

- `dpp:ProductPassport` - Passeport Produit Numérique principal
- `dpp:Warranty` - Garantie
- `dpp:WorkOrder` - Ordre de travail
- `dpp:Intervention` - Intervention technique
- `dpp:RepairEvent` - Événement de réparation
- `dpp:ServiceRequest` - Demande de service
- `dpp:Diagnostic` - Diagnostic
- `dpp:ReplacementPart` - Pièce de rechange

### Status & Lifecycle

- `dpp:ProductStatus` - Statut du produit
- `dpp:ProductLifecycleStage` - Étape du cycle de vie

### Actors

- `dpp:Retailer` - Distributeur
- `dpp:Repairer` - Réparateur
- `dpp:Manufacturer` - Fabricant
- `dpp:Consumer` - Consommateur

### Documents

- `dpp:Document` - Document associé
- `dpp:RecyclingInstructions` - Consignes de recyclage

## 🔗 Propriétés Principales

### Relations (Object Properties)

- `dpp:hasWarranty` - ProductPassport → Warranty
- `dpp:hasWorkOrder` - ProductPassport → WorkOrder
- `dpp:hasIntervention` - WorkOrder → Intervention
- `dpp:hasReplacementPart` - Intervention → ReplacementPart
- `dpp:hasDiagnostic` - Intervention → Diagnostic
- `dpp:hasCurrentStatus` - ProductPassport → ProductStatus
- `dpp:hasLifecycleStage` - ProductPassport → ProductLifecycleStage
- `dpp:hasRetailer` - ProductPassport → Retailer
- `dpp:hasRepairer` - Intervention → Repairer
- `dpp:hasManufacturer` - ProductPassport → Manufacturer
- `dpp:hasConsumer` - ProductPassport → Consumer

### Attributs (Data Properties)

- `dpp:serialNumber` - Numéro de série
- `dpp:purchaseDate` - Date d'achat
- `dpp:purchasePrice` - Prix d'achat
- `dpp:manufacturingDate` - Date de fabrication
- `dpp:warrantyType` - Type de garantie (constructeur, retailer, extension, maintenance)
- `dpp:warrantyStatus` - Statut garantie (active, expiree, suspendue, annulee)
- `dpp:workOrderStatus` - Statut ordre de travail
- `dpp:interventionType` - Type d'intervention (diagnostic, reparation, maintenance, remplacement, retour_fabricant)
- `dpp:repairStatus` - Statut de réparation
- `dpp:totalCost` - Coût total
- ... et bien d'autres

## 💡 Exemples d'utilisation

### Exemple 1: ProductPassport avec Garantie (JSON-LD)

```json
{
  "@context": "https://ns.verisav.fr/dpp/dpp.jsonld",
  "@type": "ProductPassport",
  "@id": "https://verisav.fr/products/ABC123456",
  "name": "Lave-linge Samsung",
  "serialNumber": "ABC123456",
  "purchaseDate": "2025-07-25",
  "purchasePrice": 499.99,
  "manufacturingDate": "2025-06-15",
  "manufacturingLocation": "France",
  "hasWarranty": {
    "@type": "Warranty",
    "warrantyType": "constructeur",
    "warrantyStatus": "active",
    "warrantyStartDate": "2025-07-25",
    "warrantyEndDate": "2027-07-25",
    "warrantyDurationMonths": 24
  },
  "hasCurrentStatus": {
    "@type": "ProductStatus",
    "productStatus": "sous_garantie",
    "productStatusDate": "2025-07-25"
  }
}
```

### Exemple 2: ProductPassport avec WorkOrder et Intervention (Turtle)

```turtle
@prefix dpp: <https://ns.verisav.fr/dpp#> .
@prefix schema: <https://schema.org/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<https://verisav.fr/products/ABC123456> a dpp:ProductPassport ;
    dpp:serialNumber "ABC123456" ;
    dpp:purchaseDate "2025-07-25"^^xsd:date ;
    dpp:hasWorkOrder <https://verisav.fr/workorders/WO-2025-001> .

<https://verisav.fr/workorders/WO-2025-001> a dpp:WorkOrder ;
    dpp:workOrderNumber "WO-2025-001" ;
    dpp:workOrderStatus "en_cours" ;
    dpp:workOrderPriority "haute" ;
    dpp:hasIntervention <https://verisav.fr/interventions/INT-001> .

<https://verisav.fr/interventions/INT-001> a dpp:Intervention ;
    dpp:interventionType "reparation" ;
    dpp:interventionStartDate "2025-12-10T09:00:00Z"^^xsd:dateTime ;
    dpp:interventionEndDate "2025-12-10T11:30:00Z"^^xsd:dateTime ;
    dpp:interventionDuration 150 ;
    dpp:laborCost 120.00 ;
    dpp:partsCost 45.50 ;
    dpp:totalCost 165.50 ;
    dpp:resolutionDescription "Moteur de vidange remplacé" ;
    dpp:hasReplacementPart <https://verisav.fr/parts/PART-12345> .

<https://verisav.fr/parts/PART-12345> a dpp:ReplacementPart ;
    dpp:partReference "MOT-VID-SAM-2025" ;
    dpp:partName "Moteur de vidange Samsung" .
```

### Exemple 3: Utilisation avec Schema.org

```json
{
  "@context": [
    "https://schema.org/",
    "https://ns.verisav.fr/dpp/dpp.jsonld"
  ],
  "@type": "Product",
  "name": "Lave-linge Samsung",
  "brand": "Samsung",
  "sku": "ABC123456",
  "dpp:hasWarranty": {
    "@type": "dpp:Warranty",
    "dpp:warrantyType": "constructeur",
    "dpp:warrantyStatus": "active",
    "dpp:warrantyStartDate": "2025-07-25",
    "dpp:warrantyEndDate": "2027-07-25"
  }
}
```

## 🌐 Enregistrement LOV

Pour enregistrer ce vocabulaire dans le Linked Open Vocabularies (LOV) registry:

1. **Vérifier les prérequis:**
   - Le vocabulaire doit être accessible via HTTPS
   - Le fichier OWL/Turtle doit être valide
   - Le namespace doit être résolu (Content-Type: text/turtle)

2. **Soumettre sur LOV:**
   - Aller sur https://lov.linkeddata.es/dataset/lov/
   - Cliquer sur "Suggest a vocabulary"
   - Remplir le formulaire avec:
     - Namespace: `https://ns.verisav.fr/dpp#`
     - URI du vocabulaire: `https://ns.verisav.fr/dpp/dpp.ttl`
     - Description, licence, etc.

3. **Attendre validation:**
   - L'équipe LOV valide le vocabulaire
   - Timeline: ~2-4 semaines

## 📚 Références

- **URI principale:** https://ns.verisav.fr/dpp
- **URI persistante W3ID:** https://w3id.org/verisav/dpp (URI garantie par la W3C)
- **LOV (Linked Open Vocabularies):** https://lov.linkeddata.es/dataset/lov/vocabs/dpp
- [Schema.org](https://schema.org/)
- [W3C RDF](https://www.w3.org/RDF/)
- [OWL 2 Web Ontology Language](https://www.w3.org/TR/owl2-overview/)
- [W3ID Persistent URIs](https://w3id.org/)
- [EU Digital Product Passport](https://environment.ec.europa.eu/topics/circular-economy/product-passport_en)

## 📝 Licence

Ce vocabulaire est sous licence [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

## 👥 Créé par

[Verisav](https://www.verisav.fr) - Plateforme SaaS de gestion SAV et DPP

## 🔄 Version

**Version actuelle:** 1.0.0  
**Date de création:** 2025-12-16  
**Dernière modification:** 2025-12-16

