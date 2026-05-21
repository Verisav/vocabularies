# Verisav Semantic Vocabularies

[![LOV](https://img.shields.io/badge/LOV-Validated-brightgreen)](https://lov.linkeddata.es/dataset/lov/agents/Verisav)
[![W3ID](https://img.shields.io/badge/W3ID-Persistent%20URI-blue)](https://w3id.org/verisav)
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.18016853-blue)](https://doi.org/10.5281/zenodo.18016853)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0001--0356--4421-green)](https://orcid.org/0009-0001-0356-4421)
[![npm](https://img.shields.io/badge/npm-@verisav%2Fdpp--verifiable--credentials-red)](https://www.npmjs.com/package/@verisav/dpp-verifiable-credentials)

**Open RDF/OWL standards for EU Digital Product Passports (ESPR 2024/1781), after-sales (RMA), and machine-readable warranties (WTY).**

> **Canonical live publication:** [ns.verisav.fr](https://ns.verisav.fr/) · **Persistent URIs:** [w3id.org/verisav](https://w3id.org/verisav) · **Registry:** [LOV / Verisav](https://lov.linkeddata.es/dataset/lov/agents/Verisav)

## Why now (EU DPP landscape, 2026–2030)

The [Ecodesign for Sustainable Products Regulation (ESPR, EU 2024/1781)](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R1781) is in force. **Digital Product Passports** are introduced sector by sector via delegated acts—not a single “big bang” date:

| Horizon | Sector / topic | Relevance for implementers |
|--------|----------------|----------------------------|
| **2026** | Destruction ban for unsold consumer goods (Art. 25); annual reporting | Retail & brand compliance |
| **18 Feb 2027** | **Battery passports** (Battery Regulation) | First large-scale mandatory DPP class |
| **2027–2029** | Textiles, tyres, building products, metals (working plans) | Delegated acts + 18–36 month rollout typical |
| **2029–2030** | Detergents, toys, furniture (indicative) | Long-tail product categories |

Verisav vocabularies are built for **machine-readable, interoperable** data—not PDF brochures: JSON-LD/Turtle, **GS1 Digital Link**, **UNTP DPP**, **JRC 2026 methodology** themes (essential vs recommended tiers), **W3C Verifiable Credentials (VCDM 2.0)**, and **EU Business Wallet / EUID** operator identity—aligned with EU registry and semantic-web practice ([data.europa.eu DPP](https://data.europa.eu/en/news-events/news/eus-digital-product-passport-advancing-transparency-and-sustainability), [CIRPASS-2](https://cirpass2.eu/), [GS1 Europe DPP](https://gs1.eu/activities/digital-product-passport/on-the-eu-digital-product-passport/)).

## Overview

Three complementary RDF/OWL vocabularies standardize after-sales and product passport data:

| Vocab | Role | Version (live) | Namespace |
|-------|------|----------------|-----------|
| **DPP** | Digital Product Passport · ESPR · traceability · VC/EBW | **1.5.2** | `https://w3id.org/verisav/dpp#` |
| **RMA** | Returns & service tickets | 1.0.0 | `https://w3id.org/verisav/rma#` |
| **WTY** | Machine-readable warranties & payment rules | 1.0.0 | `https://w3id.org/verisav/wty#` |

**Quality bar**

- Validated on **[LOV](https://lov.linkeddata.es/dataset/lov/vocabs/dpp)** (Linked Open Vocabularies)
- **W3ID** persistent URIs (W3C community)
- **Content negotiation** (Turtle, JSON-LD, HTML)
- **SHACL** + **JSON Schema** per vocabulary (`validation/*.shacl.ttl`, `validation/*.schema.json`)
- **CHECKSUMS.sha256** for published artefacts
- **Schema.org**-compatible patterns for the open web

## DPP highlights (v1.5.x)

Beyond core product lifecycle (warranty, repair, work orders):

- **ESPR / policy graph:** `rdfs:seeAlso` to ESPR, Data Act, Interoperable Europe Act, Commission ESPR hub, JRC methodology, CEN/CENELEC ESPR work
- **Interoperability:** GS1 Digital Link URI syntax, GTIN/GLN, UNTP DPP, ISO/IEC 19987 (EPCIS), W3C DID 1.0
- **EU identity & trust:** EU Business Wallet, EUID, W3C Verifiable Credentials ([`@verisav/dpp-verifiable-credentials`](https://www.npmjs.com/package/@verisav/dpp-verifiable-credentials) on npm)
- **Trade & customs (v1.3+):** country of production, due diligence, dimensions
- **OWL-DL** consistency (v1.5.0+)

Live docs: [ns.verisav.fr/dpp/](https://ns.verisav.fr/dpp/) · [dpp/README.md](dpp/README.md)

## npm tooling (production at Verisav)

| Package | Purpose |
|---------|---------|
| [`@verisav/dpp-verifiable-credentials`](https://www.npmjs.com/package/@verisav/dpp-verifiable-credentials) | Issue/verify W3C VCs for DPP (Veramo, EBW-ready) |
| [`@verisav/graphql-rdf-vocabularies`](https://www.npmjs.com/package/@verisav/graphql-rdf-vocabularies) | GraphQL API over TTL vocabularies (DPP, RMA, WTY) |

## Quick start

### JSON-LD

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

### Turtle

```turtle
@prefix dpp: <https://w3id.org/verisav/dpp#> .

<https://example.com/product/123> a dpp:ProductPassport ;
    dpp:serialNumber "ABC123456" ;
    dpp:purchaseDate "2025-07-25"^^xsd:date .
```

### Content negotiation

```bash
curl -H "Accept: text/turtle" https://w3id.org/verisav/dpp
curl -H "Accept: application/ld+json" https://w3id.org/verisav/dpp
curl https://w3id.org/verisav/dpp
```

### Validate (SHACL)

```bash
# Example: validate instance data against published shapes
# Shapes: dpp/validation/dpp.shacl.ttl
```

## Documentation

- [Project overview](PROJECT_OVERVIEW.md)
- [DPP](dpp/README.md) · [RMA](rma/README.md) · [WTY](wty/README.md)
- [SPARQL API](SPARQL_API.md) · [GraphQL API](GRAPHQL_API.md)
- [Technical FR/EN](DOCUMENTATION_TECHNIQUE_VOCABULAIRES_FR_EN.md)

## Links

| Resource | URL |
|----------|-----|
| Website | https://www.verisav.fr |
| Namespace | https://ns.verisav.fr/ |
| W3ID | https://w3id.org/verisav/ |
| LOV (agent) | https://lov.linkeddata.es/dataset/lov/agents/Verisav |
| Zenodo DOI (concept, latest) | https://doi.org/10.5281/zenodo.18016853 |
| Zenodo DOI (v1.5.2) | https://doi.org/10.5281/zenodo.20321287 |
| Schema.org DPP proposal | https://github.com/schemaorg/schemaorg/issues/4663 |

## Citation

```bibtex
@software{verisav_vocabularies_2026,
  title = {Verisav Semantic Vocabularies: DPP, RMA, WTY},
  author = {Boutillier, Kévin},
  year = {2026},
  publisher = {Zenodo},
  doi = {10.5281/zenodo.18016853},
  url = {https://doi.org/10.5281/zenodo.18016853},
  note = {Version 1.5.2; version-specific DOI: 10.5281/zenodo.20321287},
  version = {1.5.2}
}
```

See [CITATION.cff](CITATION.cff) for CFF metadata.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Changelog: [CHANGELOG.md](CHANGELOG.md) and per-vocabulary `*/CHANGELOG.md`.

## License

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — attribution required.

## Contact

- **Email:** k.boutillier@verisav.fr
- **Issues:** https://github.com/Verisav/vocabularies/issues

---

**Verisav** — open standards for compliant, interoperable Digital Product Passports and after-sales data.
