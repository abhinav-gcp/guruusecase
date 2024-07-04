# variables.tf

variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
  default     = "amplified-asset-426508-e7"
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-south1"
}

variable "zone" {
  description = "The zone where resources will be created"
  type        = string
  default     = "us-south1-a"
}

variable "network" {
  description = "The name of the network to deploy resources"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "The name of the subnetwork to deploy resources"
  type        = string
  default     = null
}

variable "apache_image" {
  description = "The image name for the Apache server"
  type        = string
  default     = "us-south1-docker.pkg.dev/amplified-asset-426508-e7/myrepo7/apache-image"
}

variable "tomcat_image" {
  description = "The image name for the Tomcat server"
  type        = string
  default     = "us-south1-docker.pkg.dev/amplified-asset-426508-e7/myrepo7/tomcat-image"
}
