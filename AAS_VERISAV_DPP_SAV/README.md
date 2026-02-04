# Verisav DPP/SAV – AAS Submodel Template

Template **Asset Administration Shell (AAS)** pour exposer la sémantique Verisav (Digital Product Passport et Service Après-Vente) dans un format conforme à **IEC 63278-1:2023**.

## Fichier

| Fichier | Description |
|--------|-------------|
| `verisav-dpp-sav-submodel-template.json` | Submodel AAS (kind Template) : identification produit, Material Provenance (DPP-03), garantie, événements de réparation. |

## Utilisation

- **Submodel** : à attacher à un Asset (produit) dans une AAS complète.
- **semanticId** : les éléments pointent vers `https://ns.verisav.fr/dpp#` pour l’alignement avec le vocabulaire RDF/OWL Verisav.
- **MaterialProvenance** : chaque entrée peut inclure `materialClassificationIRDI` (ECLASS) en plus de `materialName`.

## Références

- IEC 63278-1:2023 – Asset Administration Shell structure
- [Vocabulaire DPP Verisav](https://ns.verisav.fr/dpp)
- [Mapping Verisav ↔ ECLASS IRDI](https://www.verisav.fr/documents/MAPPING_VERISAV_DPP_ECLASS_IRDI_FR.pdf) (PDF FR/EN sur verisav.fr)
