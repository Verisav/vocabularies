# Verisav Semantic Vocabularies - Project Overview

## Project Description

**Verisav** is a SaaS platform that revolutionizes after-sales service (SAV) management for retailers, consumers, and manufacturers. Our mission is to digitalize and optimize the entire after-sales service journey, from product purchase to maintenance of electronic and household appliances.

## Project Scope

Verisav provides three complementary RDF/OWL vocabularies that standardize after-sales service data:

### 1. **DPP (Digital Product Passport) Vocabulary**
- **Purpose**: Represents Digital Product Passports (DPP) in compliance with EU regulations (ESPR EU 2024/1781)
- **Scope**: Product lifecycle management, warranties, repairs, and regulatory compliance
- **Standards Alignment**: GS1 Digital Link, UNTP (United Nations Transparency Protocol)
- **Key Features**: GTIN, GLN, granularity levels (model/batch/serial), material provenance, emissions, circularity, conformity claims

### 2. **RMA (Return Merchandise Authorization) Vocabulary**
- **Purpose**: Standardizes Return Merchandise Authorization (RMA) and service ticket management
- **Scope**: Communication workflows between consumers, retailers, and repairers
- **Key Features**: Return requests, service tickets, disputes, resolutions, shipping labels, message threads

### 3. **WTY (Warranty & Contracts) Vocabulary**
- **Purpose**: Machine-readable warranties and contracts for complete payment automation
- **Scope**: Automated payment decisions and coverage assessment in after-sales service
- **Key Features**: Coverage definitions, exclusions, payment rules, automated claim assessment, invoice generation

## Project Objectives

### Primary Objectives

1. **Standardization**: Replace proprietary formats (Zendesk, Salesforce, SAP) with open, interoperable RDF/OWL vocabularies
2. **Interoperability**: Enable seamless data exchange between different SAV systems and platforms
3. **Automation**: Enable complete automation of payment decisions, coverage assessment, and invoice generation
4. **Compliance**: Ensure compliance with EU regulations (ESPR EU 2024/1781) for Digital Product Passports
5. **Traceability**: Provide complete product lifecycle traceability from manufacturing to end-of-life

### Strategic Goals

- **Industry Adoption**: Promote adoption of semantic web standards in the after-sales service industry
- **Open Standards**: Contribute to the Linked Open Data ecosystem through LOV (Linked Open Vocabularies) registration
- **FAIR Principles**: Ensure vocabularies follow FAIR (Findable, Accessible, Interoperable, Reusable) principles
- **Sustainability**: Support circular economy initiatives through product traceability and lifecycle management

## Use Cases

### E-commerce Platforms
- Standardize return requests across multiple sellers
- Automate warranty validation and claim processing
- Integrate with existing e-commerce platforms (Shopify, WooCommerce, etc.)

### Retail Networks
- Standardize communication between retailers and repairers
- Centralize product warranty information
- Automate service ticket routing and resolution

### Manufacturers
- Track product lifecycle from manufacturing to end-of-life
- Monitor warranty claims and product defects
- Ensure regulatory compliance (ESPR, Digital Product Passport)

### Service Providers
- Automate payment decisions based on warranty terms
- Standardize work order management
- Integrate with existing SAV management systems

## Technical Approach

### Standards & Technologies
- **RDF/OWL**: Semantic web standards for knowledge representation
- **JSON-LD**: JSON serialization for web integration
- **Schema.org**: Alignment with Schema.org vocabulary
- **Content Negotiation**: HTTP 303 redirects for namespace resolution
- **Persistent URIs**: W3ID persistent identifiers (W3C-managed)

### Vocabulary Design Principles
1. **Modularity**: Each vocabulary addresses a specific domain (DPP, RMA, WTY)
2. **Compatibility**: Integration with existing standards (Schema.org, GS1, UNTP)
3. **Extensibility**: Support for future extensions and custom use cases
4. **Documentation**: Comprehensive documentation in multiple languages (English, French)

## Impact & Benefits

### For Businesses
- **Cost Reduction**: Automate manual processes (50,000€/month savings for 1000 tickets/month)
- **Error Reduction**: Decrease decision errors from 10-15% to <1%
- **Dispute Reduction**: Reduce disputes by 70-80% through transparent, justified decisions
- **Interoperability**: Replace proprietary formats with open standards

### For the Industry
- **Standardization**: Establish industry-wide standards for after-sales service data
- **Innovation**: Enable new services and applications through semantic data
- **Sustainability**: Support circular economy through product traceability
- **Compliance**: Facilitate regulatory compliance (EU ESPR, Digital Product Passport)

## Project Status

- **DPP Vocabulary**: Version 1.5.2 (stable)
- **RMA Vocabulary**: Version 1.2.2 (stable)
- **WTY Vocabulary**: Version 1.2.2 (stable)
- **LOV Registration**: All three vocabularies registered in Linked Open Vocabularies
- **W3ID Persistent URIs**: All vocabularies have W3C-managed persistent identifiers

## Resources

- **Project Website**: https://www.verisav.fr
- **Vocabulary Namespace**: https://ns.verisav.fr/
- **W3ID Persistent URIs**: https://w3id.org/verisav/
- **LOV Registry**: https://lov.linkeddata.es/dataset/lov/agents/Verisav
- **GitHub Repository**: https://github.com/Verisav/vocabularies

## Contact

**Creator**: Kévin Boutillier  
**Organization**: Verisav SAS  
**Email**: Available through https://www.verisav.fr  
**ORCID**: https://orcid.org/0009-0001-0356-4421

## License

All vocabularies are licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

---

*This document provides an overview of the Verisav semantic vocabularies project. For detailed technical documentation, please refer to the individual vocabulary README files.*
