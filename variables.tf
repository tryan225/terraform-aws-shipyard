variable "aws_region" {
  description = "AWS region to deploy your ec2 instance"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ami-id for your packer image"
  type        = string
  default     = "ami id here"
}

variable "lab_name" {
  description = "A name for your EC2 instance"
  type        = string
  default     = "support-lab-default"
}

variable "key_name" {
  description = "EC2 ssh keypair for your lab"
  type        = string
  default     = "ec2 keypair name here"
}

variable "blueprint_repo" {
  description = "location of the github repo for your desired shipyard blueprint"
  type        = string
  default     = "github.com/shipyard-run/blueprints//vault-k8s"
}

variable "instance_type" {
  description = "AWS EC2 instance type for your lab"
  type        = string
  default     = "t2.medium"
}

