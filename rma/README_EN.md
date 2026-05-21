# Verisav RMA / Ticketing Vocabulary

**Version:** 1.2.2  
**Primary Namespace URI:** `https://ns.verisav.fr/rma#`  
**Persistent W3ID Namespace URI:** `https://w3id.org/verisav/rma#`  
**Prefix:** `rma:`  
**Date:** 2025-12-16

## Description

RDF/OWL vocabulary for standardizing **Return Merchandise Authorization (RMA)** and **service ticket** management between consumers, retailers, and repairers.

This vocabulary complements the [DPP vocabulary](https://ns.verisav.fr/dpp):
- **DPP** = Product state (static, lifecycle)
- **RMA** = Dynamic workflows (communication, resolution)

## Strategic Objective

Standardize SAV communication to replace proprietary formats:
- ✅ Open and interoperable format (RDF/OWL)
- ✅ Compatible with Schema.org
- ✅ Integration with DPP vocabulary
- ✅ Ready for LOV submission

## Main Classes

### Core Classes

- **`rma:ReturnRequest`** - Return request (RMA)
- **`rma:Ticket`** - Service ticket
- **`rma:Dispute`** - Dispute/claim
- **`rma:Resolution`** - Resolution (refund, exchange, credit, repair)
- **`rma:ShippingLabel`** - Shipping label
- **`rma:Message`** - Messages in conversation thread
- **`rma:Approval`** - Approvals/authorizations
- **`rma:Tracking`** - Package tracking

## Main Properties

### Relations (Object Properties)

- `rma:hasReturnRequest` - Product → return request link
- `rma:hasTicket` - Product → service ticket link
- `rma:hasDispute` - Request → dispute link
- `rma:hasResolution` - Request → resolution link
- `rma:concernsProduct` - Request → concerned product link
- `rma:resultsInWorkOrder` - Request → work order link (if repair)
- `rma:requestedBy` - Request creator
- `rma:handledBy` - Handling organization

### Attributes (Data Properties)

- `rma:returnRequestNumber` - Unique RMA number
- `rma:returnReason` - Return reason
- `rma:returnRequestStatus` - Status (pending, approved, rejected, etc.)
- `rma:ticketNumber` - Ticket number
- `rma:disputeType` - Dispute type
- `rma:resolutionType` - Resolution type
- `rma:resolutionAmount` - Amount (refund/credit)
- `rma:trackingNumber` - Package tracking number
- ... and 28 other properties

## Available Files

- **`rma.ttl`** - Vocabulary in Turtle/OWL format
- **`rma.jsonld`** - JSON-LD context for JSON usage
- **`index.html`** - Human-readable HTML documentation

## Usage

### JSON-LD Example

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

### Integration with DPP

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
    "workOrderStatus": "in_progress"
  }
}
```

## Use Cases

1. **E-commerce → Repairer**
   - Shopify retailer sends standardized return request to repairer

2. **Marketplace**
   - Standardize returns for all sellers

3. **SAV Network**
   - Standardized communication retailers ↔ repairers

4. **Interoperability**
   - Replace proprietary formats (Zendesk, Salesforce, SAP) with open standard

## Validation

To validate the vocabulary:

```bash
cd apps/web/public/vocabularies/rma
python3 -c "
import rdflib
g = rdflib.Graph()
g.parse('rma.ttl', format='turtle')
print(f'✅ Valid vocabulary: {len(g)} triples')
"
```

## Statistics

- **8 classes**
- **14 object properties**
- **36 data properties**
- **433 RDF triples**

## License

Creative Commons Attribution 4.0 International (CC BY 4.0)

## Creator

[Verisav](https://www.verisav.fr)

## Links

- **Primary vocabulary URI:** https://ns.verisav.fr/rma
- **Persistent W3ID URI:** https://w3id.org/verisav/rma (W3C-guaranteed URI)
- **LOV (Linked Open Vocabularies):** https://lov.linkeddata.es/dataset/lov/vocabs/rma
- **Complementary DPP vocabulary:** https://ns.verisav.fr/dpp

## 📖 Project Overview

For a comprehensive overview of the Verisav semantic vocabularies project, its scope, and objectives, please see [PROJECT_OVERVIEW.md](../PROJECT_OVERVIEW.md).
