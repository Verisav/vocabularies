# Configuration DNS pour ns.verisav.fr

Ce document explique comment configurer le DNS pour que `ns.verisav.fr` pointe vers les fichiers du vocabulaire DPP.

## Configuration requise

Pour que `ns.verisav.fr/dpp` fonctionne, il faut :

1. **Configurer le DNS** pour que `ns.verisav.fr` pointe vers le même serveur que `www.verisav.fr`
2. **Les fichiers sont déjà configurés** dans Next.js pour être servis correctement

## Configuration DNS

### Option 1 : Record CNAME (Recommandé)

Ajoutez un record CNAME dans votre DNS :

```
Type: CNAME
Name: ns
Value: www.verisav.fr
TTL: 3600
```

Cela pointera `ns.verisav.fr` vers `www.verisav.fr`.

### Option 2 : Record A

Si vous utilisez des records A directs :

```
Type: A
Name: ns
Value: [IP_ADRESSE_DU_SERVEUR]
TTL: 3600
```

## Vérification

Une fois le DNS configuré, vous pouvez vérifier que tout fonctionne :

1. **Accès direct aux fichiers :**
   - `https://ns.verisav.fr/dpp` → Documentation HTML
   - `https://ns.verisav.fr/dpp/dpp.ttl` → Vocabulaire OWL/Turtle
   - `https://ns.verisav.fr/dpp/dpp.jsonld` → Context JSON-LD

2. **Vérifier les headers HTTP :**
   ```bash
   curl -I https://ns.verisav.fr/dpp/dpp.ttl
   ```
   
   Vous devriez voir :
   - `Content-Type: text/turtle; charset=utf-8`
   - `Access-Control-Allow-Origin: *`
   - `Cache-Control: public, max-age=3600`

3. **Vérifier le namespace :**
   Le namespace `https://ns.verisav.fr/dpp#` devrait être résolu correctement.

## URLs accessibles

Une fois configuré, les URLs suivantes seront accessibles :

- **Documentation :** `https://ns.verisav.fr/dpp` ou `https://ns.verisav.fr/dpp/`
- **Vocabulaire Turtle :** `https://ns.verisav.fr/dpp/dpp.ttl`
- **Context JSON-LD :** `https://ns.verisav.fr/dpp/dpp.jsonld`
- **Documentation HTML :** `https://ns.verisav.fr/dpp/index.html`
- **README :** `https://ns.verisav.fr/dpp/README.md`

## Notes importantes

- Les fichiers sont servis avec les bons Content-Type headers
- CORS est activé (`Access-Control-Allow-Origin: *`)
- Le cache est configuré pour 1 heure
- Les fichiers sont statiques et servis depuis `public/vocabularies/dpp/`

## Enregistrement LOV

Une fois le DNS configuré et les fichiers accessibles, vous pouvez soumettre le vocabulaire à LOV (Linked Open Vocabularies) :

1. Aller sur https://lov.linkeddata.es/dataset/lov/
2. Cliquer sur "Suggest a vocabulary"
3. Remplir avec :
   - Namespace: `https://ns.verisav.fr/dpp#`
   - URI du vocabulaire: `https://ns.verisav.fr/dpp/dpp.ttl`
   - Description, licence, etc.

