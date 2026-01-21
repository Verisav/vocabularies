# Security Policy

## Supported Versions

We actively support the following versions of Verisav Vocabularies with security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.1.x   | :white_check_mark: |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability in Verisav Vocabularies, please report it responsibly.

### How to Report

1. **Do NOT** open a public GitHub issue
2. Email security details to: **security@verisav.fr**
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### What to Expect

- We will acknowledge receipt within 48 hours
- We will provide an initial assessment within 7 days
- We will keep you informed of our progress
- We will notify you when the vulnerability is fixed

### Disclosure Policy

- We follow responsible disclosure practices
- We will credit you (if desired) when the vulnerability is disclosed
- We will coordinate public disclosure with you

## Security Best Practices

When using Verisav Vocabularies:

1. **Validate Input**: Always validate RDF/OWL data before processing
2. **Use HTTPS**: Always use HTTPS for vocabulary namespace URIs
3. **Content Negotiation**: Use proper HTTP Accept headers
4. **Version Pinning**: Pin to specific vocabulary versions in production
5. **Regular Updates**: Keep vocabulary implementations up to date

## Known Security Considerations

### RDF/OWL Processing

- Large RDF files may cause memory issues - validate file sizes
- Malformed RDF may cause parser errors - always validate syntax
- External namespace resolution - be aware of network requests

### Content Negotiation

- HTTP redirects (303) are used for namespace resolution
- Ensure your HTTP client follows redirects securely
- Validate content types returned by servers

## Contact

For security-related questions or concerns:
- **Email**: security@verisav.fr
- **PGP Key**: [Available upon request]

Thank you for helping keep Verisav Vocabularies secure!
