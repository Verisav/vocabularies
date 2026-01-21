#!/bin/bash

# Script pour configurer GitHub et créer la release
# Nécessite un token GitHub avec les permissions: repo, admin:repo_hook

set -e

REPO="Verisav/vocabularies"
DESCRIPTION="Official RDF/OWL vocabularies for Verisav - Standardizing after-sales service data"
WEBSITE="https://www.verisav.fr"
TOPICS="rdf,owl,semantic-web,linked-data,vocabulary,digital-product-passport,warranty,after-sales-service,sav,lov,w3id,schema-org,espr,dpp"

echo "🔧 Configuration du repository GitHub..."

# Vérifier si GITHUB_TOKEN est défini
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ GITHUB_TOKEN n'est pas défini"
    echo "Pour créer un token: https://github.com/settings/tokens"
    echo "Permissions nécessaires: repo, admin:repo_hook"
    echo ""
    echo "Exécutez: export GITHUB_TOKEN=votre_token"
    exit 1
fi

# Configurer la description et le website
echo "📝 Configuration de la description et du website..."
curl -X PATCH \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO \
  -d "{\"description\":\"$DESCRIPTION\",\"homepage\":\"$WEBSITE\"}" \
  -s -o /dev/null

echo "✅ Description et website configurés"

# Ajouter les topics
echo "🏷️  Ajout des topics..."
curl -X PUT \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.mercy-preview+json" \
  https://api.github.com/repos/$REPO/topics \
  -d "{\"names\":[\"rdf\",\"owl\",\"semantic-web\",\"linked-data\",\"vocabulary\",\"digital-product-passport\",\"warranty\",\"after-sales-service\",\"sav\",\"lov\",\"w3id\",\"schema-org\",\"espr\",\"dpp\"]}" \
  -s -o /dev/null

echo "✅ Topics ajoutés"

# Créer la release v1.1.0
echo "🚀 Création de la release v1.1.0..."

RELEASE_NOTES=$(cat <<'EOF'
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
EOF
)

# Créer la release
RELEASE_RESPONSE=$(curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO/releases \
  -d "{
    \"tag_name\": \"v1.1.0\",
    \"target_commitish\": \"main\",
    \"name\": \"Verisav DPP Open Standard (VDOS) v1.1.0\",
    \"body\": $(echo "$RELEASE_NOTES" | jq -Rs .),
    \"draft\": false,
    \"prerelease\": false
  }" \
  -s)

RELEASE_ID=$(echo "$RELEASE_RESPONSE" | grep -o '"id":[0-9]*' | head -1 | cut -d':' -f2)

if [ -n "$RELEASE_ID" ]; then
    echo "✅ Release v1.1.0 créée avec succès (ID: $RELEASE_ID)"
    echo "🔗 Voir la release: https://github.com/$REPO/releases/tag/v1.1.0"
else
    echo "⚠️  Erreur lors de la création de la release"
    echo "$RELEASE_RESPONSE"
    exit 1
fi

echo ""
echo "🎉 Configuration terminée avec succès!"
echo "📊 Repository: https://github.com/$REPO"
echo "🚀 Release: https://github.com/$REPO/releases/tag/v1.1.0"
