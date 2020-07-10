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

variable "domain_url" {
  type        = string
  description = "The URL that auth requests need to be sent to"
}

variable "secret_deletion_time" {
  type        = number
  default     = 7
  description = "Amount of days that secrets will be kept after deletion"
}

variable "pool_id" {
  type        = string
  description = "ID of a user pool to create clients in"
}
