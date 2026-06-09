# IaaC con Terraform en GCP
Laboratorio IaaC con Terraform en GCP: En este Lab, se utilizó Terraform para crear dos instancias de VM, una red de VPC con dos subredes y reglas firewall para la VPC, con el fin de permitir conexiones entre ambas instancias. Adicionalmente se crea un bucket de Cloud Storage como backend remoto para alojar el archivo de State de Terraform.

Todo el deploy de Terraform se realizó de manera modular con la siguiente estructura:

- main.tf
- variables
- modules/instances/instances.tf
- modules/instances/outputs.tf
- modules/instances/variables.tf
- modules/storage/storage.tf
- modules/storage/outputs.tf
- modules/storage/variables.tf


## Tecnologías utilizadas:

[Terraform](https://developer.hashicorp.com/terraform)
[Google VPC](https://cloud.google.com/vpc?hl=es-419)
[Google Compute Engine](https://cloud.google.com/products/compute?hl=es_419)
[Google Cloud Storage](https://cloud.google.com/storage?hl=es-419)
