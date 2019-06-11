# harbor

Installs and configures the Harbor cloud native registry.

## Requirements

### Hardware

|Resource|Capacity|Description|
|---|---|---|
|CPU|minimal 2 CPU|4 CPU is preferred|
|Mem|minimal 4GB|8GB is preferred|
|Disk|minimal 40GB|160GB is preferred|

### Software

|Software|Version|Description|
|---|---|---|
|Docker engine|version 17.03.0-ce+ or higher|For installation instructions, please refer to: [docker engine doc](https://docs.docker.com/engine/installation/)|
|Docker Compose|version 1.18.0 or higher|For installation instructions, please refer to: [docker compose doc](https://docs.docker.com/compose/install/)|
|Openssl|latest is preferred|Generate certificate and keys for Harbor|

### Platforms

- RHEL 7+

### Chef

- Chef 12.11+

### Cookbooks

- docker
- ssl_certificate
