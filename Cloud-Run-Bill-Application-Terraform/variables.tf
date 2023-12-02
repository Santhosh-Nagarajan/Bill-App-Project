variable "project" {
  type        = string
  description = "Enter Your Project Id"
}

variable "region" {
  type        = string
  description = "Enter Your region"
}

variable "zone" {
  type        = string
  description = "Enter Your Zone"
}

variable "credential" {
  type        = string
  description = "Enter your credential file path"
}

variable "cloud-run-service-name" {
  type        = string
  description = "Enter your Cloud Run Name"
}

variable "port" {
  type        = number
  description = "Enter your Container Port"
}

variable "image-name" {
  type        = string
  description = "Enter your Docker Image"
}

variable "env-name" {
  type = string
  description = "Enter Your Environment Name"
}

variable "env-value" {
  type = string
  description = "Enter Your Environment Name"
}