# Dépannage - ns.verisav.fr/dpp 404

Si vous obtenez une erreur 404 sur `https://ns.verisav.fr/dpp`, voici les étapes de dépannage :

## Vérifications à faire

### 1. Configuration DNS

Vérifiez que le domaine `ns.verisav.fr` est bien configuré :

```bash
# Vérifier la résolution DNS
dig ns.verisav.fr
nslookup ns.verisav.fr
```

Le domaine doit pointer vers la même IP que `www.verisav.fr`.

### 2. Configuration Vercel

Le domaine `ns.verisav.fr` doit être ajouté dans Vercel :

1. Allez dans les paramètres du projet Vercel
2. Section "Domains"
3. Ajoutez `ns.verisav.fr`
4. Vérifiez que le domaine est "Valid"

### 3. Test sur le domaine principal

Testez d'abord sur le domaine principal pour vérifier que la route fonctionne :

- `https://www.verisav.fr/dpp` → Devrait fonctionner
- `https://www.verisav.fr/dpp/dpp.ttl` → Devrait fonctionner
- `https://www.verisav.fr/dpp/index.html` → Devrait fonctionner

### 4. Test avec curl

```bash
# Test sur le domaine principal
curl -I https://www.verisav.fr/dpp

# Test sur ns.verisav.fr (si DNS configuré)
curl -I https://ns.verisav.fr/dpp

# Vérifier les headers
curl -v https://ns.verisav.fr/dpp/dpp.ttl
```

### 5. Vérifier les logs Vercel

Dans Vercel, allez dans la section "Functions" et vérifiez les logs pour voir si la route `/dpp` est appelée et s'il y a des erreurs.

## Solutions

### Solution 1 : Attendre la propagation DNS

Si vous venez de configurer le DNS, attendez 5-15 minutes pour la propagation.

### Solution 2 : Vérifier la configuration Vercel

Assurez-vous que `ns.verisav.fr` est bien ajouté comme domaine dans Vercel et que les certificats SSL sont générés.

### Solution 3 : Utiliser www.verisav.fr temporairement

En attendant, vous pouvez utiliser :
- `https://www.verisav.fr/dpp` qui fonctionne exactement de la même manière

### Solution 4 : Vérifier que le déploiement est à jour

Assurez-vous que la dernière version du code avec la route `/dpp/[[...path]]/route.ts` est déployée :

```bash
# Vérifier les dernières déploiements
vercel list
```

## Structure des routes

Les fichiers sont accessibles via :

1. **Route API Next.js** : `/dpp/[[...path]]/route.ts`
   - Gère : `GET /dpp`, `GET /dpp/index.html`, `GET /dpp/dpp.ttl`, etc.
   - Sert les fichiers depuis `public/vocabularies/dpp/`
   - Ajoute les bons Content-Type headers

2. **Fichiers statiques** : `public/vocabularies/dpp/`
   - Accessibles directement via `/vocabularies/dpp/*` (sans headers personnalisés)

## Contact

Si le problème persiste après avoir vérifié tous les points ci-dessus, contactez l'équipe technique.

