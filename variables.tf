variable "ami" {
  type = string
  description = "Build type for our VM see the ami reference in EC2 configuration."
}

variable "instance_type" {
  type = string
  description = "The instance type for our VM"
}

variable "user" {
    type = string
    description = "The username for the VM auth"
}

variable "privateKey" {
    type = string
    description = "The path to the pKey file"
}

variable "public_key" {
  type = string
  description = "The path to the pubKey file"
}
