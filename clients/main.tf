resource "aws_cognito_resource_server" "resource" {
  identifier   = "${var.project_name}-${var.resource_name}"
  name         = "${var.project_name}-${var.resource_name}"
  user_pool_id = local.pool_id

  dynamic "scope" {
    for_each = var.resource_scopes
    content {
      scope_name        = scope.key
      scope_description = scope.value
    }
  }
}

resource "aws_cognito_user_pool_client" "clients" {
  count                = length(var.users)
  name                 = "${var.project_name}-${var.users[count.index].name}"
  user_pool_id         = local.pool_id
  generate_secret      = true
  allowed_oauth_flows  = ["client_credentials"]
  explicit_auth_flows  = ["ADMIN_NO_SRP_AUTH"]
  allowed_oauth_scopes = toset(var.users[count.index].scopes)
}

