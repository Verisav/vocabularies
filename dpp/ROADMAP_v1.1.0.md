# Roadmap Vocabulaire DPP v1.1.0

## Statut
**Version actuelle** : 1.0.0 (soumis à LOV)  
**Version prévue** : 1.1.0  
**Condition** : Après validation LOV de la v1.0.0

---

## Enrichissements Proposés

### 1. Traçabilité et Chaîne d'Approvisionnement
- [ ] `dpp:SupplyChainEvent` - Événements dans la chaîne d'approvisionnement
- [ ] `dpp:hasSupplier` - Relation avec les fournisseurs
- [ ] `dpp:batchNumber` - Numéro de lot de fabrication (DatatypeProperty)
- [ ] `dpp:originCountry` - Pays d'origine (DatatypeProperty)
- [ ] `dpp:hasSupplyChainEvent` - Lien vers événement de chaîne

### 2. Durabilité et Environnement
- [ ] `dpp:EnvironmentalImpact` - Impact environnemental du produit (Class)
- [ ] `dpp:carbonFootprint` - Empreinte carbone (DatatypeProperty)
- [ ] `dpp:materialComposition` - Composition des matériaux (DatatypeProperty ou ObjectProperty)
- [ ] `dpp:recyclabilityScore` - Score de recyclabilité (DatatypeProperty)
- [ ] `dpp:hasEnvironmentalImpact` - Lien vers impact environnemental

### 3. Maintenance Préventive
- [ ] `dpp:MaintenanceSchedule` - Planning de maintenance (Class)
- [ ] `dpp:nextMaintenanceDate` - Prochaine date de maintenance (DatatypeProperty)
- [ ] `dpp:maintenanceInterval` - Intervalle de maintenance en jours (DatatypeProperty)
- [ ] `dpp:hasMaintenanceSchedule` - Lien vers planning de maintenance

### 4. Historique de Propriété
- [ ] `dpp:OwnershipHistory` - Historique des propriétaires (Class)
- [ ] `dpp:transferDate` - Date de transfert (DatatypeProperty)
- [ ] `dpp:previousOwner` - Propriétaire précédent (ObjectProperty)
- [ ] `dpp:hasOwnershipHistory` - Lien vers historique de propriété

### 5. Conformité et Certifications
- [ ] `dpp:ComplianceStatus` - Statut de conformité réglementaire (Class)
- [ ] `dpp:certificationNumber` - Numéro de certification (DatatypeProperty)
- [ ] `dpp:regulatoryBody` - Organisme de régulation (ObjectProperty)
- [ ] `dpp:hasComplianceStatus` - Lien vers statut de conformité

### 6. Performance et Métriques
- [ ] `dpp:PerformanceMetrics` - Métriques de performance (Class)
- [ ] `dpp:usageHours` - Heures d'utilisation (DatatypeProperty)
- [ ] `dpp:energyConsumption` - Consommation énergétique (DatatypeProperty)
- [ ] `dpp:hasPerformanceMetrics` - Lien vers métriques de performance

---

## Critères pour la v1.1.0

1. ✅ Validation LOV réussie pour la v1.0.0
2. ✅ Retours de la communauté après utilisation
3. ✅ Besoins identifiés dans les projets Verisav
4. ✅ Priorisation des enrichissements selon l'usage réel

---

## Notes

Ces enrichissements seront ajoutés uniquement après :
- Validation et acceptation par LOV de la v1.0.0
- Retours d'utilisation de la communauté
- Validation de la nécessité réelle de ces termes

**Date de création** : 2025-12-16  
**Dernière mise à jour** : 2025-12-16


























