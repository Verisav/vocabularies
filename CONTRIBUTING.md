# Contributing to Verisav Vocabularies

Thank you for your interest in contributing to Verisav Semantic Vocabularies! 🎉

## How to Contribute

### Reporting Issues

If you find a bug, have a suggestion, or want to request a feature:

1. Check if the issue already exists in [GitHub Issues](https://github.com/Verisav/vocabularies/issues)
2. If not, create a new issue with:
   - Clear title and description
   - Examples and use cases when possible
   - Links to relevant documentation

### Proposing Changes

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Make your changes**
   - Ensure RDF/OWL validity
   - Update documentation
   - Add examples if applicable
4. **Test your changes** (see Validation section below)
5. **Commit your changes** (`git commit -m 'Add amazing feature'`)
6. **Push to your branch** (`git push origin feature/amazing-feature`)
7. **Open a Pull Request**

### Vocabulary Changes

When modifying vocabularies:

- ✅ All changes must maintain RDF/OWL validity
- ✅ Update version numbers appropriately (following semantic versioning)
- ✅ Update documentation (README.md, index.html)
- ✅ Test with content negotiation
- ✅ Ensure compatibility with existing implementations
- ✅ Update CHANGELOG.md

### Documentation Changes

When improving documentation:

- ✅ Keep it clear and concise
- ✅ Include examples when possible
- ✅ Update all language versions if applicable
- ✅ Check links are working

## Validation

Before submitting, validate your changes:

### Validate Turtle Files

```bash
# Using rapper (Raptor RDF Parser)
rapper -i turtle -o turtle dpp/dpp.ttl

# Using Python rdflib
python3 -c "
import rdflib
g = rdflib.Graph()
g.parse('dpp/dpp.ttl', format='turtle')
print(f'✅ Valid: {len(g)} triples')
"
```

### Validate JSON-LD

```bash
# Using Python
python3 -c "
import json
with open('dpp/dpp.jsonld') as f:
    json.load(f)
print('✅ Valid JSON-LD')
"
```

### Test Content Negotiation

```bash
# Test Turtle
curl -I -H "Accept: text/turtle" https://ns.verisav.fr/dpp

# Test JSON-LD
curl -I -H "Accept: application/ld+json" https://ns.verisav.fr/dpp

# Test HTML (default)
curl -I https://ns.verisav.fr/dpp
```

## Code Style

- Use consistent formatting
- Follow existing patterns
- Comment complex logic
- Keep files organized

## Pull Request Process

1. Update CHANGELOG.md with your changes
2. Ensure all tests pass
3. Request review from maintainers
4. Address any feedback
5. Once approved, maintainers will merge

## Questions?

If you have questions:
- Open a GitHub Discussion
- Email: contact@verisav.fr
- Check existing documentation

Thank you for contributing! 🙏
