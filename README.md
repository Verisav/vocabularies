# Verisav Semantic Vocabularies

[![LOV](https://img.shields.io/badge/LOV-Validated-brightgreen)](https://lov.linkeddata.es/dataset/lov/agents/Verisav)
[![W3ID](https://img.shields.io/badge/W3ID-Persistent%20URI-blue)](https://w3id.org/verisav)
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.18016854-blue)](https://doi.org/10.5281/zenodo.18016854)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0001--0356--4421-green)](https://orcid.org/0009-0001-0356-4421)

Official RDF/OWL vocabularies for Verisav - Standardizing after-sales service data with semantic web technologies.

## 🌟 Overview

Verisav provides three complementary RDF/OWL vocabularies that standardize after-sales service (SAV) data:

- **DPP** (Digital Product Passport) - Product lifecycle and compliance with EU regulations (ESPR EU 2024/1781)
- **RMA** (Return Merchandise Authorization) - Return and service ticket workflows  
- **WTY** (Warranty & Contracts) - Machine-readable warranties and payment automation

All vocabularies are:
- ✅ **Validated on LOV** (Linked Open Vocabularies) - World registry of RDF/OWL vocabularies
- ✅ **Published on W3ID** (W3C-managed persistent URIs) - Guaranteed persistence
- ✅ **Conformant to RDF/OWL standards** - Following W3C recommendations
- ✅ **Compatible with Schema.org** - Seamless integration with existing structured data

## 📚 Vocabularies

### 1. DPP - Digital Product Passport

**Purpose:** Represents Digital Product Passports (DPP) in compliance with EU regulations effective in 2027.

- **Namespace:** `https://w3id.org/verisav/dpp#`
- **LOV Entry:** https://lov.linkeddata.es/dataset/lov/vocabs/dpp
- **Documentation:** https://ns.verisav.fr/dpp/
- **Version:** 1.1.0
- **Key Features:** Product lifecycle, warranties, repairs, GS1 Digital Link alignment, traceability

[📖 Read DPP Documentation](dpp/README.md)

### 2. RMA - Return Merchandise Authorization

**Purpose:** Standardizes Return Merchandise Authorization (RMA) and service ticket management.

- **Namespace:** `https://w3id.org/verisav/rma#`
- **LOV Entry:** https://lov.linkeddata.es/dataset/lov/vocabs/rma
- **Documentation:** https://ns.verisav.fr/rma/
- **Version:** 1.0.0
- **Key Features:** Return requests, service tickets, disputes, resolutions, shipping labels

[📖 Read RMA Documentation](rma/README.md)

### 3. WTY - Warranty & Contracts

**Purpose:** Machine-readable warranties and contracts for complete payment automation.

- **Namespace:** `https://w3id.org/verisav/wty#`
- **LOV Entry:** https://lov.linkeddata.es/dataset/lov/vocabs/wty
- **Documentation:** https://ns.verisav.fr/wty/
- **Version:** 1.0.0
- **Key Features:** Coverage definitions, exclusions, payment rules, automated claim assessment

[📖 Read WTY Documentation](wty/README.md)

## 🚀 Quick Start

### Using JSON-LD

```json
{
  "@context": "https://ns.verisav.fr/dpp/dpp.jsonld",
  "@type": "ProductPassport",
  "@id": "https://example.com/product/123",
  "serialNumber": "ABC123456",
  "purchaseDate": "2025-07-25",
  "hasWarranty": {
    "@type": "Warranty",
    "warrantyType": "constructeur",
    "warrantyStatus": "active",
    "warrantyStartDate": "2025-07-25",
    "warrantyEndDate": "2027-07-25"
  }
}
```

### Using Turtle

```turtle
@prefix dpp: <https://w3id.org/verisav/dpp#> .
@prefix schema: <https://schema.org/> .

<https://example.com/product/123> a dpp:ProductPassport ;
    dpp:serialNumber "ABC123456" ;
    dpp:purchaseDate "2025-07-25"^^xsd:date ;
    dpp:hasWarranty [ a dpp:Warranty ;
        dpp:warrantyType "constructeur" ;
        dpp:warrantyStatus "active" ] .
```

### Content Negotiation

All vocabularies support HTTP content negotiation:

```bash
# Get Turtle format
curl -H "Accept: text/turtle" https://w3id.org/verisav/dpp

# Get JSON-LD format
curl -H "Accept: application/ld+json" https://w3id.org/verisav/dpp

# Get HTML documentation (default)
curl https://w3id.org/verisav/dpp
```

## 📖 Documentation

- [Project Overview](PROJECT_OVERVIEW.md) - Complete project description and objectives
- [DPP Vocabulary](dpp/README.md) - Digital Product Passport vocabulary
- [RMA Vocabulary](rma/README.md) - Return Merchandise Authorization vocabulary
- [WTY Vocabulary](wty/README.md) - Warranty & Contracts vocabulary

## 🔗 Links

- **Website:** https://www.verisav.fr
- **Namespace:** https://ns.verisav.fr/
- **W3ID Persistent URIs:** https://w3id.org/verisav/
- **LOV Registry:** https://lov.linkeddata.es/dataset/lov/agents/Verisav
- **LOV Agent Profile:** https://lov.linkeddata.es/dataset/lov/agents/K%C3%A9vin%20Boutillier
- **DOI (Zenodo):** https://doi.org/10.5281/zenodo.18016854

## 📊 Statistics

- **3 vocabularies** published and validated
- **26 classes** defined across all vocabularies
- **71 object properties** for relationships
- **105 data properties** for attributes
- **~1500 RDF triples** total

## 👤 Creator

**Kévin Boutillier**
- **ORCID:** [0009-0001-0356-4421](https://orcid.org/0009-0001-0356-4421)
- **Organization:** Verisav SAS
- **Email:** contact@verisav.fr
- **Website:** https://www.verisav.fr

## 📄 License

All vocabularies are licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

You are free to:
- **Share** — copy and redistribute the material in any medium or format
- **Adapt** — remix, transform, and build upon the material for any purpose, even commercially

Under the following terms:
- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made.

## 📝 Citation

If you use these vocabularies in your research or projects, please cite:

### BibTeX

```bibtex
@software{verisav_vocabularies_2025,
  title = {Verisav Semantic Vocabularies: DPP, RMA, WTY},
  author = {Boutillier, Kévin},
  year = {2025},
  month = {12},
  publisher = {Zenodo},
  doi = {10.5281/zenodo.18016854},
  url = {https://doi.org/10.5281/zenodo.18016854},
  version = {1.0.0}
}
```

### APA

Boutillier, K. (2025). Verisav Semantic Vocabularies: DPP, RMA, WTY (Version 1.0.0) [Computer software]. Zenodo. https://doi.org/10.5281/zenodo.18016854

### MLA

Boutillier, Kévin. *Verisav Semantic Vocabularies: DPP, RMA, WTY*. Version 1.0.0, Zenodo, 2025, doi:10.5281/zenodo.18016854.

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📜 Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed list of changes.

## 🌐 Use Cases

### E-commerce Platforms
- Standardize return requests across multiple sellers
- Automate warranty validation and claim processing
- Integrate with existing platforms (Shopify, WooCommerce, etc.)

### Retail Networks
- Standardize communication between retailers and repairers
- Centralize product warranty information
- Automate service ticket routing and resolution

### Manufacturers
- Track product lifecycle from manufacturing to end-of-life
- Monitor warranty claims and product defects
- Ensure regulatory compliance (ESPR, Digital Product Passport)

### Service Providers
- Automate payment decisions based on warranty terms
- Standardize work order management
- Integrate with existing SAV management systems

## 🎯 Impact

These vocabularies enable:
- **Interoperability:** Replace proprietary formats (Zendesk, Salesforce, SAP) with open standards
- **Automation:** Complete automation of payment decisions and coverage assessment
- **Compliance:** Ensure compliance with EU regulations (ESPR EU 2024/1781)
- **Traceability:** Complete product lifecycle traceability

## 🔍 Validation

All vocabularies are validated:
- ✅ RDF/OWL syntax validation
- ✅ LOV registry validation
- ✅ Content negotiation testing
- ✅ Schema.org compatibility

## 📞 Contact

For questions, suggestions, or collaboration opportunities:
- **Email:** contact@verisav.fr
- **Website:** https://www.verisav.fr
- **GitHub Issues:** [Open an issue](https://github.com/Verisav/vocabularies/issues)

---

**Made with ❤️ by [Verisav](https://www.verisav.fr)**
