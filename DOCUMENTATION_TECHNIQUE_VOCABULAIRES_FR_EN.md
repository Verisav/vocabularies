# Documentation technique – API Vocabulaires Verisav / Technical documentation – Verisav Vocabularies API

---

# Français

## Vue d’ensemble

Les API Verisav permettent d’interroger les vocabulaires RDF/OWL **DPP** (Passeport Produit Numérique), **RMA** (Retour Marchandise) et **WTY** (Garanties). Accès **ouvert**, sans authentification.

- **Documentation GraphQL** : [GRAPHQL_API.md](https://www.verisav.fr/vocabularies/GRAPHQL_API.md)
- **Documentation SPARQL** : [SPARQL_API.md](https://www.verisav.fr/vocabularies/SPARQL_API.md)
- **Documentation SPARQL (EN)** : [SPARQL_API_EN.md](https://www.verisav.fr/vocabularies/SPARQL_API_EN.md)

## API GraphQL

| Élément | Valeur |
|--------|--------|
| **URL** | `https://www.verisav.fr/api/graphql` |
| **Méthodes** | GET, POST |
| **Format** | Requêtes GraphQL (content-type: application/json) |

Exemple : lister les vocabulaires, récupérer classes et propriétés d’un vocabulaire (dpp, rma, wty). Voir GRAPHQL_API.md pour les exemples complets.

## API SPARQL (nouvelle)

| Élément | Valeur |
|--------|--------|
| **URL** | `https://www.verisav.fr/api/sparql` |
| **Méthodes** | GET (paramètre `query`), POST (body `query`) |
| **Formats de réponse** | `application/sparql-results+json` (défaut), `application/sparql-results+xml` |

Données interrogées : graphe unique contenant les trois vocabulaires (DPP, RMA, WTY). Exemples de requêtes dans SPARQL_API.md.

## Autres accès

- **REST (JSON-LD)** : `https://www.verisav.fr/api/dpp/dpp.jsonld`, `/api/rma/rma.jsonld`, `/api/wty/wty.jsonld`
- **Recherche** : `GET https://www.verisav.fr/api/v1/vocabulary/{dpp|rma|wty}/search?q=...`
- **OpenAPI (machine)** : `https://www.verisav.fr/vocabularies/openapi.yaml`

## Limites

- SPARQL : taille maximale de la requête 10 000 caractères ; lecture seule (SELECT, ASK, CONSTRUCT, DESCRIBE).
- Pas de limite d’appels documentée pour un usage raisonnable.

---

# English

## Overview

Verisav APIs provide access to the RDF/OWL vocabularies **DPP** (Digital Product Passport), **RMA** (Return Merchandise Authorization), and **WTY** (Warranty). **Open** access, no authentication.

- **GraphQL documentation**: [GRAPHQL_API.md](https://www.verisav.fr/vocabularies/GRAPHQL_API.md)
- **SPARQL documentation (FR)**: [SPARQL_API.md](https://www.verisav.fr/vocabularies/SPARQL_API.md)
- **SPARQL documentation (EN)**: [SPARQL_API_EN.md](https://www.verisav.fr/vocabularies/SPARQL_API_EN.md)

## GraphQL API

| Item | Value |
|------|--------|
| **URL** | `https://www.verisav.fr/api/graphql` |
| **Methods** | GET, POST |
| **Format** | GraphQL queries (content-type: application/json) |

Example: list vocabularies, get classes and properties for a vocabulary (dpp, rma, wty). See GRAPHQL_API.md for full examples.

## SPARQL API (new)

| Item | Value |
|------|--------|
| **URL** | `https://www.verisav.fr/api/sparql` |
| **Methods** | GET (query parameter), POST (body `query`) |
| **Response formats** | `application/sparql-results+json` (default), `application/sparql-results+xml` |

Data: single graph containing all three vocabularies (DPP, RMA, WTY). Example queries in SPARQL_API.md and SPARQL_API_EN.md.

## Other access

- **REST (JSON-LD)**: `https://www.verisav.fr/api/dpp/dpp.jsonld`, `/api/rma/rma.jsonld`, `/api/wty/wty.jsonld`
- **Search**: `GET https://www.verisav.fr/api/v1/vocabulary/{dpp|rma|wty}/search?q=...`
- **OpenAPI (machine)**: `https://www.verisav.fr/vocabularies/openapi.yaml`

## Limits

- SPARQL: maximum query size 10,000 characters; read-only (SELECT, ASK, CONSTRUCT, DESCRIBE).
- No documented rate limit for reasonable use.
