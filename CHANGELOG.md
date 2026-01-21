# Changelog

All notable changes to Verisav Semantic Vocabularies will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-12-22

### DPP Vocabulary

#### Added
- Enhanced properties for ESPR EU 2024/1781 compliance
- Improved GS1 Digital Link alignment (GTIN, GLN, Application Identifiers)
- Additional granularity levels (model, batch, serial)
- Material provenance and emissions tracking
- Circularity indicators
- Conformity claims support

#### Changed
- Updated documentation with new use cases
- Enhanced examples with ESPR compliance scenarios

#### Fixed
- Minor documentation corrections

## [1.0.0] - 2025-12-16

### Initial Release

#### Added
- **DPP Vocabulary v1.0.0**
  - Product lifecycle management
  - Warranty representation
  - Work order and intervention tracking
  - Product status and lifecycle stages
  - Actor definitions (Retailer, Repairer, Manufacturer, Consumer)
  - Document management

- **RMA Vocabulary v1.0.0**
  - Return request management
  - Service ticket workflows
  - Dispute handling
  - Resolution tracking
  - Shipping label integration
  - Message threads

- **WTY Vocabulary v1.0.0**
  - Warranty and contract representation
  - Coverage definitions
  - Exclusion rules
  - Payment rule automation
  - Claim assessment
  - Invoice generation

#### Infrastructure
- LOV (Linked Open Vocabularies) registration completed
  - DPP: https://lov.linkeddata.es/dataset/lov/vocabs/dpp
  - RMA: https://lov.linkeddata.es/dataset/lov/vocabs/rma
  - WTY: https://lov.linkeddata.es/dataset/lov/vocabs/wty

- W3ID persistent URIs published
  - DPP: https://w3id.org/verisav/dpp
  - RMA: https://w3id.org/verisav/rma
  - WTY: https://w3id.org/verisav/wty

- Content negotiation support (Turtle, JSON-LD, RDF/XML, HTML)
- Comprehensive documentation (English and French)
- JSON-LD contexts for easy integration
- Examples and use cases

#### Documentation
- Individual README files for each vocabulary
- Project overview document
- Usage examples
- Integration guides

---

## Version History

- **1.1.0** (2025-12-22) - DPP enhancements for ESPR compliance
- **1.0.0** (2025-12-16) - Initial release with all three vocabularies

---

For detailed information about each vocabulary, see:
- [DPP README](dpp/README.md)
- [RMA README](rma/README.md)
- [WTY README](wty/README.md)
