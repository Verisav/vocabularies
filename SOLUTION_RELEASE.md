# 🔧 Solution pour la Release v1.1.0

## Problème : Erreur 403 (Permissions)

Le workflow GitHub Actions n'a pas les permissions pour créer une release automatiquement.

## ✅ Solution : Créer la Release Manuellement

C'est la solution la plus simple et la plus fiable :

### Étapes :

1. **Aller sur les Releases**
   - https://github.com/Verisav/vocabularies/releases

2. **Cliquer sur "Draft a new release"**

3. **Remplir le formulaire :**
   - **Tag:** `v1.1.0` (sélectionner "Create new tag: v1.1.0")
   - **Target:** `main` (ou le commit actuel)
   - **Release title:** `Verisav DPP Open Standard (VDOS) v1.1.0`
   - **Description:** Copier le contenu ci-dessous

4. **Attacher les fichiers (optionnel mais recommandé) :**
   - Cliquer sur "Attach binaries by dropping them here or selecting them"
   - Sélectionner :
     - `dpp/verisav-dpp.ttl`
     - `rma/verisav-rma.ttl`
     - `wty/verisav-wty.ttl`

5. **Cliquer sur "Publish release"**

### Description de la Release :

```markdown
## Verisav Semantic Vocabularies v1.1.0

### DPP Vocabulary v1.1.0
- Enhanced ESPR EU 2024/1781 compliance
- Improved GS1 Digital Link alignment
- Additional granularity levels (model, batch, serial)
- Material provenance and emissions tracking
- Circularity indicators
- Conformity claims support

### All Vocabularies
- ✅ Validated on LOV (Linked Open Vocabularies)
- ✅ Published with W3ID persistent URIs
- ✅ Full content negotiation support
- ✅ Comprehensive documentation
- ✅ Usage examples included

**DOI:** https://doi.org/10.5281/zenodo.18016854  
**LOV:** https://lov.linkeddata.es/dataset/lov/agents/Verisav  
**W3ID:** https://w3id.org/verisav

### Documentation
- Complete README with badges
- Usage guide
- Contributing guidelines
- Code of conduct
- Security policy

### Examples
- Basic DPP example
- Complete DPP with work orders
- RMA return request
- WTY warranty
- Full integration example
```

## Alternative : Configurer les Permissions du Repository

Si vous voulez que le workflow automatique fonctionne à l'avenir :

1. Aller sur https://github.com/Verisav/vocabularies/settings/actions
2. Dans "Workflow permissions", sélectionner :
   - ✅ "Read and write permissions"
3. Sauvegarder

Ensuite, le workflow pourra créer les releases automatiquement.

## ✅ Après Création

Vérifier que :
- ✅ La release v1.1.0 est visible sur https://github.com/Verisav/vocabularies/releases
- ✅ Les fichiers sont attachés (si vous les avez ajoutés)
- ✅ La description est complète
