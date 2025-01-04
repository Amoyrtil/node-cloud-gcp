variable "prefix" {
  description = "Prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC network ID"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "instance_type" {
  description = "Compute Engine instance type"
  type        = string
  default     = "e2-micro"
}

variable "image_type" {
  description = "Compute Engine image"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
}

variable "persistent_disk_type" {
  description = "Persistent disk type"
  type        = string
  default     = "pd-standard"
}

variable "persistent_disk_size" {
  description = "Persistent disk size in GB"
  type        = number
  default     = 30
}
