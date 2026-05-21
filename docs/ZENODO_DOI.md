# Zenodo — Verisav Vocabularies

## Publication v1.5.2 (21 mai 2026)

| Rôle | Valeur |
|------|--------|
| **Record** | https://zenodo.org/records/20321287 |
| **DOI de cette version** | `10.5281/zenodo.20321287` |
| **Archive** | `Verisav/vocabularies-v1.5.2.zip` |
| **Source** | https://github.com/Verisav/vocabularies/tree/v1.5.2 |

Créée automatiquement via l’**intégration GitHub ↔ Zenodo** à la release `v1.5.2`.

## DOI « famille » (toutes versions, pointe vers la dernière)

| Rôle | Valeur |
|------|--------|
| **Concept** | https://zenodo.org/records/18016853 |
| **DOI concept** | **`10.5281/zenodo.18016853`** → résout vers la dernière version (v1.5.2) |

À utiliser dans **CITATION.cff**, badges README et `rdfs:seeAlso` des ontologies.

## Ancien DOI version 1.1.2 (figé)

| Rôle | Valeur |
|------|--------|
| **Record** | https://zenodo.org/records/18352147 |
| **DOI** | `10.5281/zenodo.18352147` |

Reste attaché à la release **1.1.2** (reproductibilité des citations antérieures). Ne pas le réutiliser pour citer v1.5.2.

## Historique des versions

| Version | Record | DOI version |
|---------|--------|-------------|
| v1.5.2 | [20321287](https://zenodo.org/records/20321287) | 10.5281/zenodo.20321287 |
| 1.1.2 | [18352147](https://zenodo.org/records/18352147) | 10.5281/zenodo.18352147 |
| v1.1.0 | [18328444](https://zenodo.org/records/18328444) | 10.5281/zenodo.18328444 |
| v1.0.0 | [18016854](https://zenodo.org/records/18016854) | 10.5281/zenodo.18016854 |

## Prochaine release

1. Publier une release GitHub `vX.Y.Z` sur [Verisav/vocabularies](https://github.com/Verisav/vocabularies).
2. Zenodo crée une nouvelle version (si l’intégration est active).
3. Mettre à jour `CITATION.cff` (`version`, `date-released`). Le DOI concept `18016853` reste inchangé.

Vérification : `./scripts/zenodo-check.sh`
