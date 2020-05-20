# terraform-aws-shipyard

## What is this? 
This is a terraform module to deploy an EC2 instance that has the following prerequisites for [Shipyard](https://shipyard.run):

1. Docker
2. Git
3. K3s
4. Helm
5. Nomad

The module also has a variable for `$blueprint_repo` in `./variables.tf` that, if pointing at a valid Shipyard blueprint, that blueprint will be automatically deployed on `terraform apply`.

This module is also unique that in `main.tf` port 18080 is exposed to WAN. If you take the deployed ec2 instances IPV4 address and go to port 18080, you will be able to interact with any docusaurus container deployed by the Shipyard blueprint specified.

## Quick start

### To build the Shipyard AMI:

1. `git clone` this repo to your computer.
2. Install [Packer](https://www.packer.io/).
3. Configure your AWS credentials using one of the [options supported by the AWS
   SDK](http://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/credentials.html). Usually, the easiest option is to
   set the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.
4. Run `packer build examples/shipyard-ami/shipyard-ami.json`

When the build finishes, it will output the IDs of the new AMIs. Then, reference this AMI in your `variables.tf` file for `ami_id`.

### To run your Shipyard EC2 instance:

1. Run `terraform init`
2. Configure all of the variables in `variables.tf` to your liking, using the AMI ID from the packer build for `ami_id`.
3. Run `terraform plan` and verify the resources you wish to be deployed look right
4. Run `terraform apply` and follow the prompts.

You will need to get the public IP for your EC2 instance after it is deployed if you wish to visit the docusaurus page deployed by Shipyard at `http://<ip of your ec2 instance>:18080`


