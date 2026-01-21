#!/bin/bash

# Script pour configurer GitHub et créer la release
# Nécessite un token GitHub avec les permissions: repo, admin:repo_hook

set -e

REPO="Verisav/vocabularies"
DESCRIPTION="Official RDF/OWL vocabularies for Verisav - Standardizing after-sales service data"
WEBSITE="https://www.verisav.fr"
TOPICS=("rdf" "owl" "semantic-web" "linked-data" "vocabulary" "digital-product-passport" "warranty" "after-sales-service" "sav" "lov" "w3id" "schema-org" "espr" "dpp")

echo "🔧 Configuration du repository GitHub..."

# Vérifier si GITHUB_TOKEN est défini
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ GITHUB_TOKEN n'est pas défini"
    echo ""
    echo "Pour créer un token:"
    echo "1. Aller sur https://github.com/settings/tokens"
    echo "2. Cliquer sur 'Generate new token (classic)'"
    echo "3. Donner un nom (ex: 'vocabularies-setup')"
    echo "4. Cocher les permissions: repo, admin:repo_hook"
    echo "5. Générer et copier le token"
    echo ""
    echo "Ensuite exécutez:"
    echo "  export GITHUB_TOKEN=votre_token"
    echo "  ./configure-github.sh"
    exit 1
fi

# Configurer la description et le website
echo "📝 Configuration de la description et du website..."
RESPONSE=$(curl -s -w "\n%{http_code}" -X PATCH \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO \
  -d "{\"description\":\"$DESCRIPTION\",\"homepage\":\"$WEBSITE\"}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ Description et website configurés"
else
    echo "❌ Erreur lors de la configuration (code: $HTTP_CODE)"
    echo "$BODY"
    exit 1
fi

# Ajouter les topics
echo "🏷️  Ajout des topics..."
TOPICS_JSON=$(printf '%s\n' "${TOPICS[@]}" | jq -R . | jq -s .)
RESPONSE=$(curl -s -w "\n%{http_code}" -X PUT \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.mercy-preview+json" \
  https://api.github.com/repos/$REPO/topics \
  -d "{\"names\":$TOPICS_JSON}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ Topics ajoutés: ${TOPICS[*]}"
else
    echo "⚠️  Erreur lors de l'ajout des topics (code: $HTTP_CODE)"
    echo "$BODY"
    # Ne pas échouer si les topics existent déjà
fi

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

# Échapper les sauts de ligne pour JSON
RELEASE_BODY=$(echo "$RELEASE_NOTES" | jq -Rs .)

RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO/releases \
  -d "{
    \"tag_name\": \"v1.1.0\",
    \"target_commitish\": \"main\",
    \"name\": \"Verisav DPP Open Standard (VDOS) v1.1.0\",
    \"body\": $RELEASE_BODY,
    \"draft\": false,
    \"prerelease\": false
  }")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" = "201" ]; then
    RELEASE_ID=$(echo "$BODY" | jq -r '.id // empty')
    RELEASE_URL=$(echo "$BODY" | jq -r '.html_url // empty')
    echo "✅ Release v1.1.0 créée avec succès!"
    echo "🔗 URL: $RELEASE_URL"
else
    # Vérifier si la release existe déjà
    if echo "$BODY" | grep -q "already exists"; then
        echo "ℹ️  La release v1.1.0 existe déjà"
        echo "🔗 Voir: https://github.com/$REPO/releases/tag/v1.1.0"
    else
        echo "❌ Erreur lors de la création de la release (code: $HTTP_CODE)"
        echo "$BODY"
        exit 1
    fi
fi

echo ""
echo "🎉 Configuration terminée avec succès!"
echo "📊 Repository: https://github.com/$REPO"
echo "🚀 Release: https://github.com/$REPO/releases/tag/v1.1.0"
