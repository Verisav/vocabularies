# 📚 Tous les liens ns.verisav.fr

Document récapitulatif de tous les vocabulaires RDF/OWL publiés sur `ns.verisav.fr`.

---

## 🔷 Vocabulaire DPP (Digital Product Passport)

**Description :** Vocabulaire pour les Passeports Produit Numérique (DPP) gérant le cycle de vie des produits, garanties, réparations et conformité avec les réglementations européennes.

### Liens principaux

- **Namespace URI :** `https://ns.verisav.fr/dpp#`
- **Documentation HTML :** `https://ns.verisav.fr/dpp/`
- **Fichier Turtle (.ttl) :** `https://ns.verisav.fr/dpp/dpp.ttl`
- **Contexte JSON-LD :** `https://ns.verisav.fr/dpp/dpp.jsonld`
- **Fichier RDF/XML :** `https://ns.verisav.fr/dpp/dpp.xml`

### Statistiques

- **Classes :** 17
- **Propriétés :** ~50
- **Version :** 1.0.0
- **Dernière modification :** 2025-12-28

---

## 🔷 Vocabulaire RMA (Return Merchandise Authorization / Ticketing)

**Description :** Vocabulaire pour les Autorisations de Retour de Marchandise (RMA) et la gestion de tickets SAV, standardisant la communication entre consommateurs, distributeurs et réparateurs.

### Liens principaux

- **Namespace URI :** `https://ns.verisav.fr/rma#`
- **Documentation HTML :** `https://ns.verisav.fr/rma/`
- **Fichier Turtle (.ttl) :** `https://ns.verisav.fr/rma/rma.ttl`
- **Contexte JSON-LD :** `https://ns.verisav.fr/rma/rma.jsonld`

### Statistiques

- **Classes :** 8
- **Propriétés objet :** 14
- **Propriétés données :** ~30
- **Version :** 1.0.0
- **Dernière modification :** 2025-12-28

### Intégration

- **Utilise :** `dpp:ProductPassport`, `dpp:WorkOrder`
- **Complète :** Vocabulaire DPP pour les workflows dynamiques

---

## 🔷 Vocabulaire WTY (Warranty & Contracts)

**Description :** Vocabulaire pour garanties et contrats lisibles par machine, permettant l'automatisation complète des décisions de paiement et évaluation de couverture dans le service après-vente.

### Liens principaux

- **Namespace URI :** `https://ns.verisav.fr/wty#`
- **Documentation HTML :** `https://ns.verisav.fr/wty/`
- **Fichier Turtle (.ttl) :** `https://ns.verisav.fr/wty/wty.ttl`
- **Contexte JSON-LD :** `https://ns.verisav.fr/wty/wty.jsonld`

### Statistiques

- **Classes :** 9
- **Propriétés objet :** 24
- **Propriétés données :** 33
- **Version :** 1.0.0
- **Dernière modification :** 2025-12-28

### Intégration

- **Hérite de :** `dpp:Warranty`
- **Utilise :** `dpp:ProductPassport`, `dpp:Intervention`, `rma:Ticket`, `rma:Dispute`
- **Complète :** Vocabulaires DPP et RMA pour l'automatisation financière

---

## 🔗 Relations entre vocabulaires

```
┌─────────────────────────────────────────────┐
│         ÉCOSYSTÈME VERISAV                  │
├─────────────────────────────────────────────┤
│                                             │
│  DPP (État du produit)                      │
│  └─ ProductPassport, Cycle de vie           │
│     ↑                                        │
│  RMA (Workflows dynamiques)                 │
│  └─ ReturnRequest, Ticket, Resolution       │
│     ↑                                        │
│  WTY (Règles financières)                   │
│  └─ Warranty, Contract, PaymentRule         │
│                                             │
└─────────────────────────────────────────────┘
```

### Flux d'intégration

1. **DPP** définit l'état du produit et ses garanties
2. **RMA** gère les workflows (tickets, retours, disputes)
3. **WTY** automatise les décisions financières (qui paie quoi)

---

## 📋 Format de citation

Pour citer ces vocabulaires dans vos publications ou projets :

### DPP
```
Verisav DPP Vocabulary. (2025). 
Namespace: https://ns.verisav.fr/dpp#
Version: 1.0.0
```

### RMA
```
Verisav RMA Vocabulary. (2025). 
Namespace: https://ns.verisav.fr/rma#
Version: 1.0.0
```

### WTY
```
Verisav WTY Vocabulary. (2025). 
Namespace: https://ns.verisav.fr/wty#
Version: 1.0.0
```

---

## 🔍 Validation et conformité

Tous les vocabulaires sont :

- ✅ **LOV-compliant** (métadonnées complètes selon Linked Open Vocabularies)
- ✅ **Validés syntaxiquement** (RDF/OWL valide)
- ✅ **Documentés** (HTML, README, exemples)
- ✅ **Accessibles** (CORS activé, Content-Type correct)
- ✅ **Versionnés** (via Git et métadonnées RDF)

---

## 📞 Support

Pour toute question sur ces vocabulaires :

- **Site web :** https://www.verisav.fr
- **Documentation :** Voir les fichiers README.md de chaque vocabulaire

---

**Dernière mise à jour :** 2025-12-28



