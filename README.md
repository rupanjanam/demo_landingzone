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

## Layered approach

For ease of operations, we categorize the Enterprise-scale Landing zone into 'levels'. Broadly levels comprise of (but not limited to)
the following components:

| Level | Type of resources |
| --- | --------------------- |
| Level 0 | - Components for manual to automation;<br/> eg: storage of Terraform state files <br/> - MSI, Service principals <br/> - Azure AD Groups <br/> - RBAC permissions <br/> - Secrets storage |
| Level 1 | - Management Groups <br/>- Azure Policies<br/>- Subscription organization<br/>- Custom Azure RBAC roles<br/>- Shared services<br/>- DevOps integration |
| Level 2 | - Networking resources |
| Level 3 | - Application hosting servers<br/> - Database layer |
| Level 4 | - Application layer |

Each level has its own respective Terraform states, identities with required RBAC to perform deployment. 

Having individual Terraform states enables multiple deployments to run at once using their respective state files.

Having separate identities enables us to employ principle of least priviledge and avoid priviledge escalation between levels.

To learn more about layered approach, follow the published guidance for [CAF Enterprise scale layered architecture](https://github.com/Azure/caf-terraform-landingzones/blob/master/documentation/code_architecture/hierarchy.md).

## Automation
The goal is to deploy the resources in Azure using an automated approach, which will make scalability and operations easier.

We need to integrate the repository with a DevOps platform of choice. Currently the CAF Terraform modules have integration with [Azure DevOps](https://github.com/Azure/caf-terraform-landingzones-starter/blob/starter/configuration/sandpit/pipelines/README-pipelines.md), Github, Gitlab, Bamboo. 

The deployment automation is achieved through implementing Continuous Integration/Continuous Deployment (CI/CD). We configure dedicated self-hosted environment in the DevOps solution, to run a CI/CD pipeline job.

Refer the code for [Azure DevOps integration](https://github.com/Azure/caf-terraform-landingzones-starter/tree/starter/configuration/sandpit/level1/gitops).

The repository shared within this project covers the deployment of Enterprise scale landing-zone from levels 0 till 2 (excludes the DevOps integration).





 
