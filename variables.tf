variable "cidr" {
   
   description = "The cidr block for the vpc"
   type = string
  
}

variable "public_subnet1_cidr"{
   
   description = "the cidr block for public subnet"
   type = string
}

variable "public_subnet2_cidr"{
   
   description = "the cidr block for public subnet"
   type = string
}

variable "ami" {
type = string
description = "The ami value for ec2 instance"  
}

variable "instance_type" {
  description = "value for instance type"
  type = string
}

variable "key_name" {
  description = "The key name for ec2 instance"
  type = string
  
}

variable "region" {
  description = "The region for the ec2 instance"
  type = string
}