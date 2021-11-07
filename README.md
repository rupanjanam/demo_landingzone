## What is an Enterprise scale Azure Landing zone?
An Enterprise scale landing zone is an Azure environment which is created to quickly onboard applications. A landing zone can be broadly categorized as follows: Platform landing zone and Application landing zone.

A Platform Landing zone is created to set up the Azure Platform components, which comprises of the following:
- Identity and Enterprise-scale Priviledged Access management
- EA and Azure AD tenants
- Management Groups ans Subscription organization
- Network topology and connectivity
- Management and Monitoring
- Business Continuity and Disaster recovery
- Security Governance and Compliance
- Platform Automation and DevOps

The application infrastructure (compute resources, databases etc.), is deployed after the platform landing zone is created. We follow an iterative agile approach to create the baseline platform landing zone, prior to creating the application hosting infrastructure.

For ease of operations, we categorize the Enterprise-scale Landing zone into 'levels'. Broadly levels comprise of (but not limited to)
the following components:

| Level | Type of resources |
| --- | --------------------- |
| Level 0 | - Components for manual to automation; eg: storage of Terraform state files, DevOps integration <br/> - MSI, Service principals <br/> - Azure AD Groups <br/> - RBAC permissions <br/> - Secrets storage |
| Level 1 | - Management Groups <br/>- Azure Policies<br/>- Subscription organization<br/>- Custom Azure RBAC roles<br/>- Shared services |
| Level 2 | - Networking resources |
| Level 3 | - Application hosting servers<br/> - Database layer |
| Level 4 | - Application layer |



 
