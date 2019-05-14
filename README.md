## This files creates a group of VMs in Google Cloud, installs and configure a Kubernetes Cluster.


## Attention: This is not for production yet, see the TODO list

## How works

The terraform files create a set of VMs, the number is defined in the var node_count with default 3 
and creates the hosts file that will be used by Ansible as inventory. When the terraform finishes the VMs creation, it calls the Ansible to execute the kubernetes.yml playbook.

## How to use:

1. Clone this repo: `git clone https://github.com/dcna-io/kubernetes.git`
2. Export the path to JSON file that contains the GCP authenticate data: 
`export GOOGLE_APPLICATION_CREDENTIALS="/path/to/json/gcp.json"`
3. Modify the variables in vars.tf
4. Initialize the terraform plugins: `terraform init`
5. Execute the terraform plan: `terraform plan`
6. Finally, apply the configuration: `terraform apply`

## TODO

1. Make possible to configure more than one master
2. Create tags for executing some specific tasks, like add more nodes.
3. Add tests
