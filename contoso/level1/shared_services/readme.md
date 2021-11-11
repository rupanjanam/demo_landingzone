## Level 1 Shared Services
The shared services layer includes but is not limited to the following services:
- Log Analytics workspace and solutions
- Storage Account
- Event Hubs
- Backup and DR resources
- Automation account

This level is meant to host platform monitoring and operations resources.
The following monitoring deployments are set through Azure Policy in this repository:

- Send Azure Activity logs to Log analytics workspace
- Send Azure Resource logs to Log analytics workspace
- Send VM/VM scale sets monitoring logs to Log analytics workspace
- Send Network Flow logs to Log analytics workspace