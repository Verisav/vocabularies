# Vocabulaire RMA / Ticketing Verisav

**Version:** 1.0.0  
**Namespace (URI principale):** `https://ns.verisav.fr/rma#`  
**Namespace (URI persistante W3ID):** `https://w3id.org/verisav/rma#`  
**Préfixe:** `rma:`  
**Date:** 2025-12-16

## Description

Vocabulaire RDF/OWL pour standardiser la gestion des **Retours de Marchandise (RMA)** et des **tickets SAV** entre consommateurs, distributeurs et réparateurs.

Ce vocabulaire complète le [vocabulaire DPP](https://ns.verisav.fr/dpp) :
- **DPP** = État du produit (statique, cycle de vie)
- **RMA** = Workflows dynamiques (communication, résolution)

## Objectif Stratégique

Standardiser la communication SAV pour remplacer les formats propriétaires :
- ✅ Format ouvert et interopérable (RDF/OWL)
- ✅ Compatible avec Schema.org
- ✅ Intégration avec vocabulaire DPP
- ✅ Prêt pour soumission LOV

## Classes Principales

### Core Classes

- **`rma:ReturnRequest`** - Demande de retour (RMA)
- **`rma:Ticket`** - Ticket SAV
- **`rma:Dispute`** - Litige/réclamation
- **`rma:Resolution`** - Résolution (remboursement, échange, avoir, réparation)
- **`rma:ShippingLabel`** - Étiquette d'expédition
- **`rma:Message`** - Messages dans le fil de conversation
- **`rma:Approval`** - Approbations/autorisations
- **`rma:Tracking`** - Suivi de colis

## Propriétés Principales

### Relations (Object Properties)

- `rma:hasReturnRequest` - Lien produit → demande de retour
- `rma:hasTicket` - Lien produit → ticket SAV
- `rma:hasDispute` - Lien demande → litige
- `rma:hasResolution` - Lien demande → résolution
- `rma:concernsProduct` - Lien demande → produit concerné
- `rma:resultsInWorkOrder` - Lien demande → ordre de travail (si réparation)
- `rma:requestedBy` - Créateur de la demande
- `rma:handledBy` - Organisation qui traite

### Attributs (Data Properties)

- `rma:returnRequestNumber` - Numéro RMA unique
- `rma:returnReason` - Raison du retour
- `rma:returnRequestStatus` - Statut (pending, approved, rejected, etc.)
- `rma:ticketNumber` - Numéro de ticket
- `rma:disputeType` - Type de litige
- `rma:resolutionType` - Type de résolution
- `rma:resolutionAmount` - Montant (remboursement/avoir)
- `rma:trackingNumber` - Numéro de suivi colis
- ... et 28 autres propriétés

## Fichiers Disponibles

- **`rma.ttl`** - Vocabulaire en format Turtle/OWL
- **`rma.jsonld`** - Context JSON-LD pour utilisation dans JSON
- **`rma.xml`** - Sérialisation RDF/XML pour intégrations SI entreprise
- **`CHECKSUMS.sha256`** - Empreintes SHA-256 des fichiers publiés
- **`CHANGELOG.md`** - Historique des versions (Added/Changed/Breaking Changes)
- **`validation/rma.shacl.ttl`** - Règles SHACL de validation sémantique
- **`validation/rma.schema.json`** - JSON Schema de pré-validation
- **`index.html`** - Documentation HTML lisible par les humains

## Utilisation

### Exemple JSON-LD

```json
{
  "@context": "https://ns.verisav.fr/rma/rma.jsonld",
  "@type": "ReturnRequest",
  "returnRequestNumber": "RMA-2025-001234",
  "returnReason": "defective",
  "returnRequestDate": "2025-12-16T10:30:00Z",
  "returnRequestStatus": "approved",
  "concernsProduct": {
    "@type": "Product",
    "sku": "PROD-12345"
  },
  "hasResolution": {
    "@type": "Resolution",
    "resolutionType": "refund",
    "resolutionAmount": 299.99,
    "resolutionCurrency": "EUR"
  }
}
```

### Intégration avec DPP

```json
{
  "@context": [
    "https://ns.verisav.fr/dpp/dpp.jsonld",
    "https://ns.verisav.fr/rma/rma.jsonld"
  ],
  "@type": "ProductPassport",
  "serialNumber": "SN-123456",
  "hasReturnRequest": {
    "@type": "ReturnRequest",
    "returnRequestNumber": "RMA-2025-001234"
  },
  "hasWorkOrder": {
    "@type": "WorkOrder",
    "workOrderStatus": "en_cours"
  }
}
```

## Cas d'Usage

1. **E-commerce → Réparateur**
   - Retailer Shopify envoie demande de retour standardisée à réparateur

2. **Marketplace**
   - Standardiser les retours pour tous les vendeurs

3. **Réseau de SAV**
   - Communication standardisée retailers ↔ réparateurs

4. **Interopérabilité**
   - Remplacer formats propriétaires (Zendesk, Salesforce, SAP) par standard ouvert

## Validation

Pour valider le vocabulaire :

```bash
cd apps/web/public/vocabularies/rma
python3 -c "
import rdflib
g = rdflib.Graph()
g.parse('rma.ttl', format='turtle')
print(f'✅ Vocabulaire valide : {len(g)} triplets')
"
```

## Statistiques

- **8 classes**
- **14 propriétés objet**
- **36 propriétés de données**
- **433 triplets RDF**

## Licence

Creative Commons Attribution 4.0 International (CC BY 4.0)

## Créateur

[Verisav](https://www.verisav.fr)

## Liens

- **URI principale du vocabulaire:** https://ns.verisav.fr/rma
- **URI persistante W3ID:** https://w3id.org/verisav/rma (URI garantie par la W3C)
- **LOV (Linked Open Vocabularies):** https://lov.linkeddata.es/dataset/lov/vocabs/rma
- **Vocabulaire DPP complémentaire:** https://ns.verisav.fr/dpp

