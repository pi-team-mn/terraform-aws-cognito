output "secret_names" {
  value = aws_secretsmanager_secret.secret.*.name
}
