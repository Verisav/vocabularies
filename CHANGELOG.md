# Changelog

All notable changes to Verisav Semantic Vocabularies will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.2] - 2026-05-07

### DPP Vocabulary v1.5.2

#### Added
- EU policy alignment: ESPR, Data Act, Interoperable Europe Act, JRC 2026 methodology, CIRPASS-2, GS1 Digital Link / EPCIS, W3C DID 1.0
- SHACL shapes and JSON Schema (`validation/dpp.shacl.ttl`, `validation/dpp.schema.json`)
- Distribution checksums (`CHECKSUMS.sha256`)
- Multi-format publication: Turtle, JSON-LD, RDF/XML

#### Changed
- Canonical artefact names: `dpp.ttl`, `dpp.jsonld`, `dpp.xml` (replaces legacy `verisav-dpp.ttl`)
- OWL-DL consistency fixes (v1.5.0+)

#### Fixed
- TraceabilityEvent ISO reference link

### Repository

- README aligned with ESPR 2026–2030 implementation timeline
- Project overview and technical documentation (FR/EN)

## [1.2.0] - 2026-01-23

### DPP Vocabulary v1.2.0

#### Added
- EU Business Wallet (EBW) and W3C Verifiable Credentials (VCDM 2.0) support

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
