data "aws_cognito_user_pools" "pools" {
  name = var.pool_name
}
