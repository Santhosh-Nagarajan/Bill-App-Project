######## VPC NETWORK ########
variable "project-id" {
  type        = string
  description = "Enter Your Project Id"
}

variable "region" {
  type        = string
  description = "Enter Your Region"
}

variable "zone" {
  type        = string
  description = "Enter Your Zone"
}

variable "credential" {
  type        = string
  description = "Enter Your JSON file"
}

variable "vpc-name" {
  type        = string
  description = "Enter Your VPC Name"
}


variable "routing-mode" {
  type        = string
  description = "Enter Your Project Id"
}

variable "private-subnet-cidr" {
  description = "Subnet IP CIDR range"
  type        = string
}

variable "public-subnet-cidr" {
  type        = string
  description = "Enter Public Subnet Cidr"

}

variable "firewall-source-range" {
  type        = list(string)
  description = "Enter Your Firewall Source Range"
}
#####################################################
#################### Cloud Sql ######################
#####################################################

variable "sql-database-instance-name" {
  type        = string
  description = "Enter Your sql database name"
}

variable "database-version" {
  type        = string
  description = "Enter Your Database Version"
}

variable "tier" {
  type        = string
  description = "Enter Your Tier"
}

variable "database-name" {
  type        = string
  description = "Enter Your Data Base Name"
}

variable "sql-user" {
  type = string
  description = "Enter User MYSQL User Name"
}

variable "sql-password" {
  type = string
  description = "Enter User MYSQL User Password"
}





#####################################################
#################### Compute Engine #################
#####################################################

variable "instance-name" {
  type        = string
  description = "Enter Your Instance Name"
}

variable "machine-type" {
  type        = string
  description = "Enter Your Instance Machine Type"
}


variable "size" {
  type        = string
  description = "Enter Your Size"
}

variable "image-name" {
  type        = string
  description = "Enter Your Image Name"
}

variable "startup-script" {
  type        = string
  description = "Enter your test script file"
}

variable "email" {
  type        = string
  description = "Enter Your email"
}

#############################################################