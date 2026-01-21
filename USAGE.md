# Usage Guide

Complete guide to using Verisav Semantic Vocabularies.

## Table of Contents

- [Quick Start](#quick-start)
- [JSON-LD Usage](#json-ld-usage)
- [Turtle Usage](#turtle-usage)
- [Content Negotiation](#content-negotiation)
- [Integration with Schema.org](#integration-with-schemaorg)
- [Best Practices](#best-practices)
- [Common Patterns](#common-patterns)

## Quick Start

### Using JSON-LD (Recommended for Web)

```json
{
  "@context": "https://ns.verisav.fr/dpp/dpp.jsonld",
  "@type": "ProductPassport",
  "serialNumber": "ABC123456",
  "hasWarranty": {
    "@type": "Warranty",
    "warrantyType": "constructeur",
    "warrantyStatus": "active"
  }
}
```

### Using Turtle (Recommended for RDF Processing)

```turtle
@prefix dpp: <https://w3id.org/verisav/dpp#> .

<https://example.com/product/123> a dpp:ProductPassport ;
    dpp:serialNumber "ABC123456" ;
    dpp:hasWarranty [ a dpp:Warranty ;
        dpp:warrantyType "constructeur" ] .
```

## JSON-LD Usage

### Basic Example

```json
{
  "@context": "https://ns.verisav.fr/dpp/dpp.jsonld",
  "@type": "ProductPassport",
  "@id": "https://example.com/products/123",
  "serialNumber": "ABC123456",
  "purchaseDate": "2025-07-25"
}
```

### With Multiple Vocabularies

```json
{
  "@context": [
    "https://schema.org/",
    "https://ns.verisav.fr/dpp/dpp.jsonld",
    "https://ns.verisav.fr/rma/rma.jsonld"
  ],
  "@type": ["Product", "ProductPassport"],
  "name": "Samsung Washing Machine",
  "serialNumber": "ABC123456",
  "hasReturnRequest": {
    "@type": "ReturnRequest",
    "returnRequestNumber": "RMA-2025-001"
  }
}
```

### Using JavaScript

```javascript
// Load context
const context = await fetch('https://ns.verisav.fr/dpp/dpp.jsonld')
  .then(r => r.json());

// Create data
const data = {
  "@context": context,
  "@type": "ProductPassport",
  "serialNumber": "ABC123456"
};

// Expand to RDF
import jsonld from 'jsonld';
const expanded = await jsonld.expand(data);
```

### Using Python

```python
import json
from pyld import jsonld

# Load context
with open('dpp.jsonld', 'r') as f:
    context = json.load(f)

# Create data
data = {
    "@context": context,
    "@type": "ProductPassport",
    "serialNumber": "ABC123456"
}

# Expand to RDF
expanded = jsonld.expand(data)
```

## Turtle Usage

### Basic Example

```turtle
@prefix dpp: <https://w3id.org/verisav/dpp#> .
@prefix schema: <https://schema.org/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<https://example.com/product/123> a dpp:ProductPassport ;
    dpp:serialNumber "ABC123456" ;
    dpp:purchaseDate "2025-07-25"^^xsd:date ;
    dpp:hasWarranty [ a dpp:Warranty ;
        dpp:warrantyType "constructeur" ;
        dpp:warrantyStatus "active" ] .
```

### Using rdflib (Python)

```python
import rdflib
from rdflib.namespace import RDF

# Create graph
g = rdflib.Graph()

# Bind namespaces
g.bind("dpp", "https://w3id.org/verisav/dpp#")

# Parse Turtle
g.parse("data.ttl", format="turtle")

# Query
for s, p, o in g.triples((None, RDF.type, None)):
    print(f"{s} is a {o}")
```

## Content Negotiation

All vocabularies support HTTP content negotiation:

### Get Turtle Format

```bash
curl -H "Accept: text/turtle" https://w3id.org/verisav/dpp
```

### Get JSON-LD Format

```bash
curl -H "Accept: application/ld+json" https://w3id.org/verisav/dpp
```

### Get HTML Documentation (Default)

```bash
curl https://w3id.org/verisav/dpp
```

### Using in Code

```javascript
// Fetch with content negotiation
const response = await fetch('https://w3id.org/verisav/dpp', {
  headers: {
    'Accept': 'application/ld+json'
  }
});
const data = await response.json();
```

## Integration with Schema.org

Verisav vocabularies are designed to work seamlessly with Schema.org:

```json
{
  "@context": [
    "https://schema.org/",
    "https://ns.verisav.fr/dpp/dpp.jsonld"
  ],
  "@type": ["Product", "ProductPassport"],
  "name": "Samsung Washing Machine",
  "brand": {
    "@type": "Brand",
    "name": "Samsung"
  },
  "sku": "WW90T534AAW",
  "dpp:serialNumber": "ABC123456",
  "dpp:hasWarranty": {
    "@type": "dpp:Warranty",
    "dpp:warrantyType": "constructeur"
  }
}
```

## Best Practices

### 1. Always Use Persistent URIs

✅ **Good:**
```json
{
  "@context": "https://w3id.org/verisav/dpp#"
}
```

❌ **Avoid:**
```json
{
  "@context": "https://ns.verisav.fr/dpp#"
}
```

(Note: Both work, but W3ID provides guaranteed persistence)

### 2. Include @id for Resources

✅ **Good:**
```json
{
  "@id": "https://example.com/product/123",
  "@type": "ProductPassport"
}
```

### 3. Use Proper Data Types

✅ **Good:**
```json
{
  "purchaseDate": "2025-07-25",
  "purchasePrice": 499.99
}
```

### 4. Validate Your Data

Always validate RDF/OWL data before using in production:

```python
import rdflib

g = rdflib.Graph()
try:
    g.parse("data.ttl", format="turtle")
    print("✅ Valid RDF")
except Exception as e:
    print(f"❌ Invalid: {e}")
```

## Common Patterns

### Product with Warranty

```json
{
  "@context": "https://ns.verisav.fr/dpp/dpp.jsonld",
  "@type": "ProductPassport",
  "serialNumber": "ABC123456",
  "hasWarranty": {
    "@type": "Warranty",
    "warrantyType": "constructeur",
    "warrantyStatus": "active",
    "warrantyStartDate": "2025-07-25",
    "warrantyEndDate": "2027-07-25"
  }
}
```

### Return Request with Resolution

```json
{
  "@context": "https://ns.verisav.fr/rma/rma.jsonld",
  "@type": "ReturnRequest",
  "returnRequestNumber": "RMA-2025-001",
  "returnReason": "defective",
  "hasResolution": {
    "@type": "Resolution",
    "resolutionType": "refund",
    "resolutionAmount": 499.99
  }
}
```

### Warranty with Payment Rules

```json
{
  "@context": "https://ns.verisav.fr/wty/wty.jsonld",
  "@type": "Warranty",
  "definesPaymentRule": {
    "@type": "PaymentRule",
    "firstParty": {
      "@type": "Organization",
      "name": "Samsung"
    },
    "paymentPercentage": 100.0
  }
}
```

## Resources

- [DPP Documentation](dpp/README.md)
- [RMA Documentation](rma/README.md)
- [WTY Documentation](wty/README.md)
- [Examples](examples/)
- [LOV Registry](https://lov.linkeddata.es/dataset/lov/agents/Verisav)
