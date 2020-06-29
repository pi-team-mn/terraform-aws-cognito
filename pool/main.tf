resource "aws_cognito_user_pool" "pool" {
  name = var.pool_name
}

resource "aws_cognito_user_pool_domain" "pool" {
  domain       = var.pool_name
  user_pool_id = aws_cognito_user_pool.pool.id
}
