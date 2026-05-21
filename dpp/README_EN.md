# Verisav Digital Product Passport (DPP) Vocabulary

RDF/OWL vocabulary for representing Digital Product Passports (DPP) in compliance with EU regulations 2027.

## 📋 Table of Contents

- [Namespace](#namespace)
- [Files](#files)
- [Main Classes](#main-classes)
- [Main Properties](#main-properties)
- [Usage Examples](#usage-examples)
- [LOV Registration](#lov-registration)

## 🔗 Namespace

### Primary URI (Verisav)
```
https://ns.verisav.fr/dpp#
```

### Persistent W3ID URI
```
https://w3id.org/verisav/dpp#
```

Both URIs are equivalent and point to the same vocabulary. The W3ID URI provides W3C-guaranteed persistence.

## 📁 Files

- **`dpp.ttl`** - Complete OWL/Turtle vocabulary file
- **`dpp.jsonld`** - JSON-LD context for easy integration
- **`index.html`** - HTML documentation of the vocabulary
- **`README.md`** - This file (French version)
- **`README_EN.md`** - English version

## 🏗️ Main Classes

### Core Classes

- `dpp:ProductPassport` - Main Digital Product Passport
- `dpp:Warranty` - Warranty
- `dpp:WorkOrder` - Work order
- `dpp:Intervention` - Technical intervention
- `dpp:RepairEvent` - Repair event
- `dpp:ServiceRequest` - Service request
- `dpp:Diagnostic` - Diagnostic
- `dpp:ReplacementPart` - Replacement part

### Status & Lifecycle

- `dpp:ProductStatus` - Product status
- `dpp:ProductLifecycleStage` - Lifecycle stage

### Actors

- `dpp:Retailer` - Retailer
- `dpp:Repairer` - Repairer
- `dpp:Manufacturer` - Manufacturer
- `dpp:Consumer` - Consumer

### Documents

- `dpp:Document` - Associated document
- `dpp:RecyclingInstructions` - Recycling instructions

## 🔗 Main Properties

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

### Attributes (Data Properties)

- `dpp:serialNumber` - Serial number
- `dpp:purchaseDate` - Purchase date
- `dpp:purchasePrice` - Purchase price
- `dpp:manufacturingDate` - Manufacturing date
- `dpp:warrantyType` - Warranty type (manufacturer, retailer, extension, maintenance)
- `dpp:warrantyStatus` - Warranty status (active, expired, suspended, cancelled)
- `dpp:workOrderStatus` - Work order status
- `dpp:interventionType` - Intervention type (diagnostic, repair, maintenance, replacement, return_to_manufacturer)
- `dpp:repairStatus` - Repair status
- `dpp:totalCost` - Total cost
- ... and many more

## 💡 Usage Examples

### Example 1: ProductPassport with Warranty (JSON-LD)

```json
{
  "@context": "https://ns.verisav.fr/dpp/dpp.jsonld",
  "@type": "ProductPassport",
  "@id": "https://verisav.fr/products/ABC123456",
  "name": "Samsung Washing Machine",
  "serialNumber": "ABC123456",
  "purchaseDate": "2025-07-25",
  "purchasePrice": 499.99,
  "manufacturingDate": "2025-06-15",
  "manufacturingLocation": "France",
  "hasWarranty": {
    "@type": "Warranty",
    "warrantyType": "manufacturer",
    "warrantyStatus": "active",
    "warrantyStartDate": "2025-07-25",
    "warrantyEndDate": "2027-07-25",
    "warrantyDurationMonths": 24
  },
  "hasCurrentStatus": {
    "@type": "ProductStatus",
    "productStatus": "under_warranty",
    "productStatusDate": "2025-07-25"
  }
}
```

### Example 2: ProductPassport with WorkOrder and Intervention (Turtle)

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
    dpp:workOrderStatus "in_progress" ;
    dpp:workOrderPriority "high" ;
    dpp:hasIntervention <https://verisav.fr/interventions/INT-001> .

<https://verisav.fr/interventions/INT-001> a dpp:Intervention ;
    dpp:interventionType "repair" ;
    dpp:interventionStartDate "2025-12-10T09:00:00Z"^^xsd:dateTime ;
    dpp:interventionEndDate "2025-12-10T11:30:00Z"^^xsd:dateTime ;
    dpp:interventionDuration 150 ;
    dpp:laborCost 120.00 ;
    dpp:partsCost 45.50 ;
    dpp:totalCost 165.50 ;
    dpp:resolutionDescription "Drain pump motor replaced" ;
    dpp:hasReplacementPart <https://verisav.fr/parts/PART-12345> .

<https://verisav.fr/parts/PART-12345> a dpp:ReplacementPart ;
    dpp:partReference "MOT-VID-SAM-2025" ;
    dpp:partName "Samsung Drain Pump Motor" .
```

### Example 3: Usage with Schema.org

```json
{
  "@context": [
    "https://schema.org/",
    "https://ns.verisav.fr/dpp/dpp.jsonld"
  ],
  "@type": "Product",
  "name": "Samsung Washing Machine",
  "brand": "Samsung",
  "sku": "ABC123456",
  "dpp:hasWarranty": {
    "@type": "dpp:Warranty",
    "dpp:warrantyType": "manufacturer",
    "dpp:warrantyStatus": "active",
    "dpp:warrantyStartDate": "2025-07-25",
    "dpp:warrantyEndDate": "2027-07-25"
  }
}
```

## 🌐 LOV Registration

This vocabulary is registered in the Linked Open Vocabularies (LOV) registry:

- **LOV Entry**: https://lov.linkeddata.es/dataset/lov/vocabs/dpp
- **Namespace**: `https://ns.verisav.fr/dpp#`
- **Persistent URI**: `https://w3id.org/verisav/dpp#`

## 📚 References

- **Primary URI**: https://ns.verisav.fr/dpp
- **Persistent W3ID URI**: https://w3id.org/verisav/dpp (W3C-guaranteed URI)
- **LOV (Linked Open Vocabularies)**: https://lov.linkeddata.es/dataset/lov/vocabs/dpp
- [Schema.org](https://schema.org/)
- [W3C RDF](https://www.w3.org/RDF/)
- [OWL 2 Web Ontology Language](https://www.w3.org/TR/owl2-overview/)
- [W3ID Persistent URIs](https://w3id.org/)
- [EU Digital Product Passport](https://environment.ec.europa.eu/topics/circular-economy/product-passport_en)

## 📝 License

This vocabulary is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

## 👥 Created by

[Verisav](https://www.verisav.fr) - SaaS platform for SAV management and DPP

## 🔄 Version

**Current version**: 1.5.2  
**Creation date**: 2025-12-16  
**Last modification**: 2026-05-07

## 📖 Project Overview

For a comprehensive overview of the Verisav semantic vocabularies project, its scope, and objectives, please see [PROJECT_OVERVIEW.md](../PROJECT_OVERVIEW.md).
