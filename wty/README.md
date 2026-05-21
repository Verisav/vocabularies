# Vocabulaire Warranty & Contracts (WTY/CNT) - Verisav

**Version:** 1.2.2  
**Date:** 16 décembre 2025  
**Namespace (URI principale):** `https://ns.verisav.fr/wty#`  
**Namespace (URI persistante W3ID):** `https://w3id.org/verisav/wty#`  
**Préfixe:** `wty:`

## 🎯 Objectif

Standardiser les **garanties et contrats** sous un format **machine-readable**, permettant l'**automatisation complète** des décisions de paiement et évaluation de couverture dans le service après-vente.

### Problème résolu

**Situation actuelle :**
- Produit casse → Ticket ouvert (RMA)
- Question cruciale : **Qui paie ?**
- Réponse : Dans un PDF illisible de 40 pages (garantie)

**Avec WTY :**
- Produit casse → Ticket ouvert (RMA)
- **Automatisation** : Le système lit la garantie structurée
- **Décision automatique** : Qui paie (client, retailer, fabricant, assurance)
- **Facturation automatique** : Bon acteur facturé
- **Tracabilité** : Décision justifiée par la garantie

## 📊 Statistiques

- **9 classes** principales
- **24 propriétés objet**
- **33 propriétés de données**
- **~557 triplets RDF**

## 📁 Fichiers publiés

- **`wty.ttl`** - Vocabulaire OWL/Turtle
- **`wty.jsonld`** - Context JSON-LD
- **`wty.xml`** - Sérialisation RDF/XML
- **`CHECKSUMS.sha256`** - Empreintes SHA-256 des artefacts
- **`CHANGELOG.md`** - Historique des versions (Added/Changed/Breaking Changes)
- **`validation/wty.shacl.ttl`** - Règles SHACL de validation sémantique
- **`validation/wty.schema.json`** - JSON Schema de pré-validation

## 🏗️ Architecture

### Classes principales

1. **`wty:Warranty`** - Garantie étendue (hérite de `dpp:Warranty`)
2. **`wty:Contract`** - Contrat (maintenance, extension, assurance)
3. **`wty:Coverage`** - Couverture (ce qui est couvert)
4. **`wty:Exclusion`** - Exclusions (ce qui n'est pas couvert)
5. **`wty:PaymentRule`** - Règle de paiement (**cœur de l'automatisation**)
6. **`wty:Condition`** - Conditions d'application
7. **`wty:Limit`** - Limites (financières, temporelles)
8. **`wty:ClaimAssessment`** - Évaluation automatique
9. **`wty:Invoice`** - Facture générée

### Flux d'automatisation

```
RMA:Ticket (réclamation)
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

## 💡 Cas d'usage

### Cas 1 : Garantie constructeur 2 ans

```turtle
:garantie1 a wty:Warranty ;
    dpp:warrantyType "constructeur" ;
    dpp:warrantyDurationMonths 24 ;
    wty:definesCoverage :couverture1 ;
    wty:definesPaymentRule :paiement1 .

:couverture1 a wty:Coverage ;
    wty:coversDefectType "defaut_fabrication" ;
    wty:coveragePeriod "24_months" .

:paiement1 a wty:PaymentRule ;
    wty:firstParty :fabricant ;
    wty:paysFor :reparation, :pieces, :deplacement ;
    wty:paymentPercentage 100.0 .
```

**Résultat automatique :** Fabricant paie 100% si défaut de fabrication

### Cas 2 : Garantie retailer avec exclusions

```turtle
:garantie2 a wty:Warranty ;
    dpp:warrantyType "retailer" ;
    wty:definesCoverage :couverture2 ;
    wty:definesExclusions :exclusion1 ;
    wty:definesPaymentRule :paiement2 ;
    wty:definesLimits :limit1 .

:exclusion1 a wty:Exclusion ;
    wty:excludedDefectType "usure_normale" ;
    wty:excludedCause "dommages_client" .

:paiement2 a wty:PaymentRule ;
    wty:firstParty :retailer ;
    wty:paysFor :reparation ;
    wty:hasPaymentLimit true .

:limit1 a wty:Limit ;
    wty:limitType "amount" ;
    wty:limitAmount 500.00 ;
    wty:limitCurrency "EUR" .
```

**Résultat automatique :** Retailer paie jusqu'à 500€ sauf usure normale

### Cas 3 : Contrat de maintenance

```turtle
:contrat1 a wty:Contract ;
    wty:contractType "maintenance" ;
    wty:contractNumber "CNT-2025-001" ;
    wty:definesCoverage :couverture3 ;
    wty:definesPaymentRule :paiement3 .

:couverture3 a wty:Coverage ;
    wty:coversRepairType "maintenance_preventive", "entretien" ;
    wty:coveragePeriod "12_months" .

:paiement3 a wty:PaymentRule ;
    wty:firstParty :client ;
    wty:paysFor :maintenance ;
    wty:paymentAmount 299.99 ;
    wty:paymentCurrency "EUR" .
```

**Résultat automatique :** Client paie 299.99€/an pour maintenance

## 🔗 Intégration

### Avec DPP

- Hérite de `dpp:Warranty`
- Utilise `dpp:ProductPassport`
- Utilise `dpp:Intervention`, `dpp:WorkOrder`, `dpp:Diagnostic`

### Avec RMA

- Utilise `rma:Ticket` pour déclencher les évaluations
- Utilise `rma:Dispute` pour les litiges
- Génère des `wty:Invoice` pour les résolutions

### Avec Schema.org

- Compatible avec `schema:WarrantyScope`
- Compatible avec `schema:Contract`
- Compatible avec `schema:Invoice`

## 📈 Impact business

### Automatisation totale

**Avant :**
- Décision manuelle : 15-30 minutes par ticket
- Erreurs : 10-15% des cas
- Coût : ~50€ par décision

**Après :**
- Décision automatique : < 1 seconde
- Erreurs : < 1% des cas
- Coût : ~0.01€ par décision

**Économie :** 49.99€ par ticket × 1000 tickets/mois = **50 000€/mois**

### Réduction des litiges

- Décision transparente et justifiée
- Client voit pourquoi il paie (ou pas)
- Référence à la garantie structurée
- **Réduction de 70-80% des litiges**

## 📚 Fichiers

- **`wty.ttl`** - Vocabulaire RDF/OWL en Turtle
- **`wty.jsonld`** - Contexte JSON-LD
- **`index.html`** - Documentation HTML
- **`README.md`** - Ce fichier

## 🔗 Liens

- **Namespace URI principale :** `https://ns.verisav.fr/wty#`
- **Namespace URI persistante W3ID :** `https://w3id.org/verisav/wty#` (URI garantie par la W3C)
- **LOV (Linked Open Vocabularies) :** https://lov.linkeddata.es/dataset/lov/vocabs/wty
- **Fichier Turtle :** `https://ns.verisav.fr/wty/wty.ttl`
- **Contexte JSON-LD :** `https://ns.verisav.fr/wty/wty.jsonld`
- **Documentation :** `https://ns.verisav.fr/wty/`

## 📄 Licence

Licence [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

## 👥 Auteur

[Verisav](https://www.verisav.fr)

---

Voir aussi :
- [Vocabulaire DPP](https://ns.verisav.fr/dpp)
- [Vocabulaire RMA](https://ns.verisav.fr/rma)

