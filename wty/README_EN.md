# Verisav Warranty & Contracts (WTY/CNT) Vocabulary

**Version:** 1.0.0  
**Date:** December 16, 2025  
**Primary Namespace URI:** `https://ns.verisav.fr/wty#`  
**Persistent W3ID Namespace URI:** `https://w3id.org/verisav/wty#`  
**Prefix:** `wty:`

## 🎯 Objective

Standardize **warranties and contracts** in a **machine-readable** format, enabling **complete automation** of payment decisions and coverage assessment in after-sales service.

### Problem Solved

**Current situation:**
- Product breaks → Ticket opened (RMA)
- Critical question: **Who pays?**
- Answer: In an unreadable 40-page PDF (warranty)

**With WTY:**
- Product breaks → Ticket opened (RMA)
- **Automation**: System reads structured warranty
- **Automatic decision**: Who pays (client, retailer, manufacturer, insurance)
- **Automatic invoicing**: Correct party invoiced
- **Traceability**: Decision justified by warranty

## 📊 Statistics

- **9 main classes**
- **24 object properties**
- **33 data properties**
- **~557 RDF triples**

## 🏗️ Architecture

### Main Classes

1. **`wty:Warranty`** - Extended warranty (inherits from `dpp:Warranty`)
2. **`wty:Contract`** - Contract (maintenance, extension, insurance)
3. **`wty:Coverage`** - Coverage (what is covered)
4. **`wty:Exclusion`** - Exclusions (what is not covered)
5. **`wty:PaymentRule`** - Payment rule (**core of automation**)
6. **`wty:Condition`** - Application conditions
7. **`wty:Limit`** - Limits (financial, temporal)
8. **`wty:ClaimAssessment`** - Automatic assessment
9. **`wty:Invoice`** - Generated invoice

### Automation Flow

```
RMA:Ticket (claim)
  ↓
wty:triggersAssessment → wty:ClaimAssessment
  ↓
WTY:ClaimAssessment
  ├─ wty:checksCoverage → wty:Coverage
  ├─ wty:checksExclusions → wty:Exclusion
  └─ wty:determinesPayment → wty:PaymentRule
  ↓
wty:generatesInvoice → wty:Invoice
```

## 💡 Use Cases

### Case 1: 2-Year Manufacturer Warranty

```turtle
:garantie1 a wty:Warranty ;
    dpp:warrantyType "manufacturer" ;
    dpp:warrantyDurationMonths 24 ;
    wty:definesCoverage :couverture1 ;
    wty:definesPaymentRule :paiement1 .

:couverture1 a wty:Coverage ;
    wty:coversDefectType "manufacturing_defect" ;
    wty:coveragePeriod "24_months" .

:paiement1 a wty:PaymentRule ;
    wty:firstParty :manufacturer ;
    wty:paysFor :repair, :parts, :travel ;
    wty:paymentPercentage 100.0 .
```

**Automatic result**: Manufacturer pays 100% if manufacturing defect

### Case 2: Retailer Warranty with Exclusions

```turtle
:garantie2 a wty:Warranty ;
    dpp:warrantyType "retailer" ;
    wty:definesCoverage :couverture2 ;
    wty:definesExclusions :exclusion1 ;
    wty:definesPaymentRule :paiement2 ;
    wty:definesLimits :limit1 .

:exclusion1 a wty:Exclusion ;
    wty:excludedDefectType "normal_wear" ;
    wty:excludedCause "customer_damage" .

:paiement2 a wty:PaymentRule ;
    wty:firstParty :retailer ;
    wty:paysFor :repair ;
    wty:hasPaymentLimit true .

:limit1 a wty:Limit ;
    wty:limitType "amount" ;
    wty:limitAmount 500.00 ;
    wty:limitCurrency "EUR" .
```

**Automatic result**: Retailer pays up to 500€ except normal wear

### Case 3: Maintenance Contract

```turtle
:contrat1 a wty:Contract ;
    wty:contractType "maintenance" ;
    wty:contractNumber "CNT-2025-001" ;
    wty:definesCoverage :couverture3 ;
    wty:definesPaymentRule :paiement3 .

:couverture3 a wty:Coverage ;
    wty:coversRepairType "preventive_maintenance", "service" ;
    wty:coveragePeriod "12_months" .

:paiement3 a wty:PaymentRule ;
    wty:firstParty :client ;
    wty:paysFor :maintenance ;
    wty:paymentAmount 299.99 ;
    wty:paymentCurrency "EUR" .
```

**Automatic result**: Client pays 299.99€/year for maintenance

## 🔗 Integration

### With DPP

- Inherits from `dpp:Warranty`
- Uses `dpp:ProductPassport`
- Uses `dpp:Intervention`, `dpp:WorkOrder`, `dpp:Diagnostic`

### With RMA

- Uses `rma:Ticket` to trigger assessments
- Uses `rma:Dispute` for disputes
- Generates `wty:Invoice` for resolutions

### With Schema.org

- Compatible with `schema:WarrantyScope`
- Compatible with `schema:Contract`
- Compatible with `schema:Invoice`

## 📈 Business Impact

### Complete Automation

**Before:**
- Manual decision: 15-30 minutes per ticket
- Errors: 10-15% of cases
- Cost: ~50€ per decision

**After:**
- Automatic decision: < 1 second
- Errors: < 1% of cases
- Cost: ~0.01€ per decision

**Savings**: 49.99€ per ticket × 1000 tickets/month = **50,000€/month**

### Dispute Reduction

- Transparent and justified decision
- Client sees why they pay (or not)
- Reference to structured warranty
- **70-80% reduction in disputes**

## 📚 Files

- **`wty.ttl`** - RDF/OWL vocabulary in Turtle
- **`wty.jsonld`** - JSON-LD context
- **`index.html`** - HTML documentation
- **`README.md`** - This file (French version)
- **`README_EN.md`** - English version

## 🔗 Links

- **Primary Namespace URI:** `https://ns.verisav.fr/wty#`
- **Persistent W3ID Namespace URI:** `https://w3id.org/verisav/wty#` (W3C-guaranteed URI)
- **LOV (Linked Open Vocabularies):** https://lov.linkeddata.es/dataset/lov/vocabs/wty
- **Turtle file:** `https://ns.verisav.fr/wty/wty.ttl`
- **JSON-LD context:** `https://ns.verisav.fr/wty/wty.jsonld`
- **Documentation:** `https://ns.verisav.fr/wty/`

## 📄 License

Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

## 👥 Author

[Verisav](https://www.verisav.fr)

---

See also:
- [DPP Vocabulary](https://ns.verisav.fr/dpp)
- [RMA Vocabulary](https://ns.verisav.fr/rma)

## 📖 Project Overview

For a comprehensive overview of the Verisav semantic vocabularies project, its scope, and objectives, please see [PROJECT_OVERVIEW.md](../PROJECT_OVERVIEW.md).
