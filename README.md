# create-cf2023-infrastructure

> Infrastructure repository for George's talk on Adobe ColdFusion Summit 2023
> to show ColdBox multi-site feature with **cbwctl** tool.

## Set up

Create a file `terraform.tfvars` and copy your AWS credentials, e.g.

```terraform
aws_access_key = "<aws-access-key>"
aws_secret_key = "<aws-secret-key>"

# AMI ID with installed cbwctl tool
ami_id = "ami-0668653f3d91cdb3a"
```

## Terraform workflow

First of all you have to initialize Terraform and download all needed providers.
In a terminal, run:

```bash
$ terraform init
```

To create actual AWS infrastructure, run `terraform apply` command as following:

```bash
$ terraform apply -auto-approve
```

To destroy all resources deployed in AWS, run `terraform destroy` command.

```bash
$ terraform destroy -auto-approve
```

## Tricks

Run `terraform output` command to see all needed information about the created infrastructure, e.g.

```bash
$ terraform output
ec2_ipv4_address = "http://107.21.73.92"
ssh_connection = "ubuntu@ec2-107-21-73-92.compute-1.amazonaws.com"
ssh_private_key = <sensitive>
```

Use `ssh_connection` value to ssh into the AWS. You can obtain SSH private key by executing
`terraform output ssh_private_key` command. You can output `ssh_private_key` in raw and redirect the content
into the file, so you can use it later by ssh connection.

> All `*.key` files are gitignored, so you can have `ssh.key` directly in your working directory.
> It will be not tracked by Git.

```bash
$ terraform output -raw ssh_private_key > ssh.key
$ chmod 0600 ssh.key
$ ssh -i ssh.key ubuntu@ec2-107-21-73-92.compute-1.amazonaws.com
```
