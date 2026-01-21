# 🔧 Correction Publication Zenodo

## 📊 État Actuel

Votre publication Zenodo existe : https://zenodo.org/records/18328444

### ✅ Ce qui est correct :
- ✅ Description complète et professionnelle
- ✅ Créateur : Kévin Boutillier avec ORCID
- ✅ Affiliation : Verisav
- ✅ Mots-clés complets
- ✅ Licence CC BY 4.0
- ✅ Lien vers GitHub
- ✅ DOI : 10.5281/zenodo.18328444

### ❌ Problème identifié :
- ❌ **Version : `v1.1.O`** (avec O majuscule) au lieu de `v1.1.0` (avec 0)
- ❌ Fichier : `Verisav/vocabularies-v1.1.O.zip` (avec O)
- ❌ Lien GitHub : `https://github.com/Verisav/vocabularies/tree/v1.1.O` (avec O)

## 🔧 Solution : Créer une Nouvelle Version

### Option 1: Créer une Nouvelle Version (Recommandé)

1. **Aller sur votre publication :**
   - https://zenodo.org/records/18328444

2. **Cliquer sur "New version"** (en haut à droite)

3. **Corriger les informations :**
   - **Version :** `v1.1.0` (avec 0, pas O)
   - Vérifier que la description est correcte
   - Uploader les fichiers de la v1.1.0

4. **Publier**

Cela créera un nouveau DOI pour la version corrigée.

### Option 2: Mettre à Jour la Version Actuelle

Si vous avez les droits d'édition :

1. Aller sur https://zenodo.org/records/18328444
2. Cliquer sur "Edit" (si disponible)
3. Corriger la version de `v1.1.O` à `v1.1.0`
4. Sauvegarder

## 📝 Mise à Jour du CITATION.cff

Une fois la nouvelle version créée avec le bon numéro, mettre à jour le CITATION.cff :

```yaml
version: "1.1.0"  # Au lieu de 1.0.0
doi: "10.5281/zenodo.XXXXX"  # Nouveau DOI si nouvelle version
date-released: "2026-01-21"  # Date de publication
```

## ✅ Vérification Finale

Après correction, vérifier :
- ✅ Version : `v1.1.0` (avec 0)
- ✅ DOI fonctionne
- ✅ Lien GitHub pointe vers `v1.1.0`
- ✅ Fichiers à jour
- ✅ Description complète

## 🔗 Liens

- Publication actuelle : https://zenodo.org/records/18328444
- DOI actuel : 10.5281/zenodo.18328444
- GitHub : https://github.com/Verisav/vocabularies

## 💡 Note

Le problème vient du tag GitHub `v1.1.O` qui a été créé par erreur. On l'a déjà corrigé sur GitHub (tag `v1.1.0` créé), mais Zenodo a archivé l'ancienne version avec le O.

La meilleure solution est de créer une nouvelle version Zenodo avec le bon numéro `v1.1.0`.
