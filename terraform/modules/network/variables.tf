variable "prefix" {
  description = "Prefix for resources"
  type        = string
}

variable "ssh_source_ranges" {
  description = "Source ranges for SSH"
  type        = list(string)
}
