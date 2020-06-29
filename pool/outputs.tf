output "auth_domain" {
  value = "https://${aws_cognito_user_pool_domain.pool.domain}.auth.${var.region}.amazoncognito.com"
}

output "endpoint" {
  value = aws_cognito_user_pool.pool.endpoint
}

output "endpoint_signing_key_url" {
  value = "https://${aws_cognito_user_pool.pool.endpoint}/.well-known/jwks.json"
}

output "user_pool_id" {
  value = aws_cognito_user_pool.pool.id
}

output "user_pool_name" {
  value = aws_cognito_user_pool.pool.name
}
