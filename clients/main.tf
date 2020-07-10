resource "aws_cognito_resource_server" "resource" {
  identifier   = "${var.project_name}-${var.resource_name}"
  name         = "${var.project_name}-${var.resource_name}"
  user_pool_id = var.pool_id

  dynamic "scope" {
    for_each = var.resource_scopes
    content {
      scope_name        = scope.key
      scope_description = scope.value
    }
  }
}

resource "aws_cognito_user_pool_client" "clients" {
  count                                = length(var.users)
  name                                 = "${var.project_name}-${var.users[count.index].name}"
  user_pool_id                         = var.pool_id
  generate_secret                      = true
  allowed_oauth_flows                  = ["client_credentials"]
  allowed_oauth_flows_user_pool_client = true
  #  explicit_auth_flows                  = ["ADMIN_NO_SRP_AUTH"]
  # todo: scopes are not yet figured out
  allowed_oauth_scopes                 = aws_cognito_resource_server.resource.scope_identifiers
}


resource "aws_secretsmanager_secret" "secret" {
  # todo move to Hashicorp vault when we have it
  count                   = length(var.users)
  recovery_window_in_days = var.secret_deletion_time
  name                    = "auth-${aws_cognito_user_pool_client.clients[count.index].name}"
}

resource "aws_secretsmanager_secret_version" "secret" {
  count     = length(var.users)
  secret_id = aws_secretsmanager_secret.secret[count.index].id

  secret_string = jsonencode({
    client_id      = aws_cognito_user_pool_client.clients[count.index].id
    client_secret  = aws_cognito_user_pool_client.clients[count.index].client_secret
    encoded_secret = "Basic ${base64encode(join(":", [aws_cognito_user_pool_client.clients[count.index].id, aws_cognito_user_pool_client.clients[count.index].client_secret]))}"
    grant_type     = "client_credentials"
    domain_url     = var.domain_url
    token_url      = "${var.domain_url}/oauth2/token"
  })
}
