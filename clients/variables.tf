variable "users" {
  type = list(object({
    name: string,
    scopes: list(string)
  }))
}

variable "resource_name" {
  type = string
}

variable "resource_scopes" {
  type        = map(string)
  default     = {}
  description = "Resource scopes that this server can have."
}

variable "project_name" {
  type = string
}

variable "pool_name" {
  type = string
}


locals {
  pool_id = element(tolist(data.aws_cognito_user_pools.pools.ids), 0)
}
