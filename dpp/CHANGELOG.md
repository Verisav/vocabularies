# Changelog DPP

Toutes les évolutions notables du vocabulaire `dpp` sont documentées ici.

## [1.5.2] - 2026-05-07

### Added
- `rdfs:seeAlso` vers ESPR, Data Act, Interoperable Europe Act, JRC methodology, CEN/CENELEC, CIRPASS-2, CircularData, data.europa.eu, GS1 Europe DPP, syntaxe URI GS1 Digital Link, ISO/IEC 19987 (EPCIS), W3C DID 1.0, LOV/W3ID/Zenodo/GitHub.

### Fixed
- Lien ISO incorrect sur `TraceabilityEvent`.

### Breaking Changes
- Aucune.

## [1.5.1] - 2026-05

### Added
- Bloc politique UE et références CEN/CENELEC pour l’ESPR.

### Breaking Changes
- Aucune.

## [1.5.0] - 2026-05

### Changed
- Corrections OWL-DL pour cohérence logique.

### Breaking Changes
- Aucune.

## [1.4.0] - 2026-04-29

### Added
- Métadonnées de versioning officielles: `owl:versionIRI`, `dcterms:issued`.
- Distribution checksum: `CHECKSUMS.sha256`.
- Artefacts de validation publiés: `validation/dpp.shacl.ttl` et `validation/dpp.schema.json`.

### Changed
- Synchronisation de la publication multi-format (`dpp.ttl`, `dpp.jsonld`, `dpp.xml`).
- Mise à jour de la date de version dans l’ontologie (`dcterms:modified`).

### Breaking Changes
- Aucune.

## [1.3.0] - 2026-02-07

### Added
- Alignement douane: `countryOfProduction`, `dueDiligenceDeclaration`, `ProductDimensions`, `hasDimensions`, `weightKg`, `lengthCm`, `widthCm`, `heightCm`, `volumeL`.

### Breaking Changes
- Aucune.

## [1.2.0] - 2026-01-23

### Added
- EU Business Wallet (EBW), W3C Verifiable Credentials, classes et propriétés associées.

### Breaking Changes
- Aucune.

## [1.1.0] - 2025-01-XX

### Added
- Alignement UNTP (provenance, circularité, émissions, traçabilité, conformité).

### Breaking Changes
- Aucune.

## [1.0.0] - 2025-12-16

### Added
- Première publication stable du vocabulaire DPP.

### Breaking Changes
- N/A (version initiale).
