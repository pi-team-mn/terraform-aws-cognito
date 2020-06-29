variable "pool_name" {
  type        = string
  description = "The name of the pool in AWS"
}

variable "region" {
  type        = string
  description = "Region to deploy in"
  default     = "eu-central-1"
}
