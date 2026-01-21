# Examples

This directory contains example usage of Verisav Semantic Vocabularies.

## Files

### Basic Examples

- **`dpp-basic.jsonld`** - Simple DPP vocabulary usage with warranty
- **`rma-return.jsonld`** - Return Merchandise Authorization example
- **`wty-warranty.jsonld`** - Warranty and contract example

### Advanced Examples

- **`dpp-complete.jsonld`** - Complete DPP with work orders, interventions, and diagnostics
- **`integration-dpp-rma-wty.jsonld`** - Integration of all three vocabularies

## Usage

### Using with JSON-LD

```javascript
// Load the context
const context = "https://ns.verisav.fr/dpp/dpp.jsonld";

// Your data
const data = {
  "@context": context,
  "@type": "ProductPassport",
  "serialNumber": "ABC123456",
  // ... rest of your data
};

// Process with JSON-LD library
import jsonld from 'jsonld';
const expanded = await jsonld.expand(data);
```

### Using with Python

```python
import json
import rdflib
from pyld import jsonld

# Load JSON-LD
with open('dpp-basic.jsonld', 'r') as f:
    data = json.load(f)

# Expand to RDF
expanded = jsonld.expand(data)

# Convert to RDF graph
g = rdflib.Graph()
g.parse(data=json.dumps(expanded), format='json-ld')
```

### Using with Turtle

See the individual vocabulary README files for Turtle examples:
- [DPP README](../dpp/README.md)
- [RMA README](../rma/README.md)
- [WTY README](../wty/README.md)

## Validation

All examples are validated and can be used as reference implementations.

To validate an example:

```bash
# Validate JSON syntax
python3 -c "import json; json.load(open('dpp-basic.jsonld'))"

# Validate with JSON-LD processor
python3 -c "from pyld import jsonld; jsonld.expand(json.load(open('dpp-basic.jsonld')))"
```

## Contributing

If you have a useful example, please submit a pull request! Examples should:
- Be valid JSON-LD
- Use proper namespaces
- Include comments explaining complex parts
- Follow the existing style
