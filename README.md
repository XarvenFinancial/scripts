# scripts
Publicly accessible scripts repository


### Scaffold Script

#### Usage

`./scaffold.sh <group> <target> <name>`

- **Group:** Subfolder of scaffolds repo
- **Target:** Subfolder of above folder
- **Name:** Name of project i.e. `my-service-name`

**Notes:**
 - `Name` is transformed for compatibility, replacing hyphens with underscrors `my-service` => `my_service`
 - `Name` is passed (transformed) the the initialisation script for the target (if any)

Run with curl:

```bash
curl -fsSL https://raw.githubusercontent.com/XarvenFinancial/scripts/main/devops/scaffold.sh | bash -s -- rust service service_tera_xf
```