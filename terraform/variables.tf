variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
  sensitive   = true
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
  default     = "us-west1"
}

variable "gcp_zone" {
  description = "GCP zone"
  type        = string
  default     = "us-west1-b"
}

variable "environment" {
  description = "environment identifier"
  type        = string
  default     = "prd"
}

variable "additional_ssh_source_ranges" {
  description = "Additional source ranges for SSH. (The IP address of the machine running Terraform is already included.)"
  type        = list(string)
  default     = []
}

locals {
  prefix = "${var.gcp_project_id}-${var.environment}"
  ssh_source_ranges = concat(
    ["${jsondecode(data.http.terraform_runner_ip.response_body)["ip"]}/32"],
    var.additional_ssh_source_ranges
  )
}
