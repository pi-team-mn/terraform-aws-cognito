resource "aws_cognito_user_pool" "pool" {
  name              = var.pool_name
  mfa_configuration = "OPTIONAL"

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_signup
  }

  device_configuration {
    challenge_required_on_new_device      = true
    device_only_remembered_on_user_prompt = true
  }
  password_policy {
    minimum_length                   = 16
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 1
  }

  software_token_mfa_configuration {
    enabled = true
  }
}

resource "aws_cognito_user_pool_domain" "pool" {
  domain       = var.pool_name
  user_pool_id = aws_cognito_user_pool.pool.id
}
