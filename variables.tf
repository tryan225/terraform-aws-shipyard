variable "ami_id" {
  description = "ami-id for your packer image"
  type        = string
  default     = "ami-0341039a017f65d45"
}

variable "lab_name" {
  description = "A name for your EC2 instance"
  type        = string
  default     = "support-lab-default"
}

variable "key_name" {
  description = "EC2 ssh keypair for your lab"
  type        = string
  default     = "tyler-support-us-east-1"
}

variable "blueprint_repo" {
  description = "location of the github repo for your desired shipyard blueprint"
  type        = string
  default     = "github.com/shipyard-run/blueprints//consul-docker"
}

variable "instance_type" {
  description = "AWS EC2 instance type for your lab"
  type        = string
  default     = "t2.medium"
}

