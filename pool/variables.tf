variable "pool_name" {
  type        = string
  description = "The name of the pool in AWS"
}

variable "region" {
  type        = string
  description = "Region to deploy in"
  default     = "eu-central-1"
}

variable "allow_signup" {
  default     = false
  description = "Allow users to create their own accounts"
}
