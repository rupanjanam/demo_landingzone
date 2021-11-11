## Level 2 Networking Foundation
The Level 2 Networking Foundation layer consists of all the networking components such as :

- Virtual Networks (Spokes)
- virtual WANs
- ExpressRoute circuits
- VPNs
- Firewall solutions
and so on.

In this repository, we are creating the following networking infrastructure:

- 1 vWAN with 2 vHUBs
- 2 VNET Spokes
- vHUB to Spokes connections
- Azure Firewall to secure 1 vHUB
- Azure Firewall Policies
- vHUB Route tables

Some customers may choose not to use a vWAN and opt for a Hub and Spoke model. To help the customer make the decision for vWAN vs Hub-Spoke, refer this [CAF Networking](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/define-an-azure-network-topology) article.
