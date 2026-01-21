# Instructions pour Configurer GitHub et Créer la Release

## Option 1: Via le Script Automatique (Recommandé)

### Étape 1: Créer un Token GitHub

1. Aller sur https://github.com/settings/tokens
2. Cliquer sur **"Generate new token (classic)"**
3. Donner un nom (ex: `vocabularies-setup`)
4. Cocher les permissions:
   - ✅ `repo` (Full control of private repositories)
   - ✅ `admin:repo_hook` (Full control of repository hooks)
5. Cliquer sur **"Generate token"**
6. **Copier le token** (vous ne pourrez plus le voir après)

### Étape 2: Exécuter le Script

```bash
cd /Users/kevinboutillier/Desktop/vocabularies-temp
export GITHUB_TOKEN=votre_token_ici
./configure-github.sh
```

Le script va automatiquement:
- ✅ Configurer la description du repository
- ✅ Configurer le website
- ✅ Ajouter tous les topics
- ✅ Créer la release v1.1.0

## Option 2: Via l'Interface Web GitHub

### 1. Configurer la Section "About"

1. Aller sur https://github.com/Verisav/vocabularies
2. Cliquer sur l'icône ⚙️ (Settings) à droite de "About"
3. Remplir:
   - **Description:** `Official RDF/OWL vocabularies for Verisav - Standardizing after-sales service data`
   - **Website:** `https://www.verisav.fr`
   - **Topics:** Ajouter un par un:
     - `rdf`
     - `owl`
     - `semantic-web`
     - `linked-data`
     - `vocabulary`
     - `digital-product-passport`
     - `warranty`
     - `after-sales-service`
     - `sav`
     - `lov`
     - `w3id`
     - `schema-org`
     - `espr`
     - `dpp`

### 2. Créer la Release v1.1.0

1. Aller sur https://github.com/Verisav/vocabularies/releases
2. Cliquer sur **"Draft a new release"**
3. Remplir:
   - **Tag:** `v1.1.0` (créer nouveau tag)
   - **Release title:** `Verisav DPP Open Standard (VDOS) v1.1.0`
   - **Description:** Copier le contenu ci-dessous
4. Cliquer sur **"Publish release"**

#### Description de la Release:

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

## Vérification

Après configuration, vérifier:
- ✅ Description affichée dans "About"
- ✅ Topics affichés (14 topics)
- ✅ Release v1.1.0 créée
- ✅ Badges s'affichent dans le README
- ✅ Workflow GitHub Actions passe

## Liens Utiles

- Repository: https://github.com/Verisav/vocabularies
- Releases: https://github.com/Verisav/vocabularies/releases
- Settings: https://github.com/Verisav/vocabularies/settings
- Actions: https://github.com/Verisav/vocabularies/actions
