# Outputs de la infraestructura

output "website_endpoint" {
  description = "URL del endpoint del website estático en S3"
  value       = "http://${aws_s3_bucket_website_configuration.static_website_config.website_endpoint}"
}

output "bucket_name" {
  description = "Nombre del bucket S3 creado"
  value       = aws_s3_bucket.static_website.id
}

output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = aws_s3_bucket.static_website.arn
}

output "website_domain" {
  description = "Dominio del website"
  value       = aws_s3_bucket_website_configuration.static_website_config.website_endpoint
}

output "region" {
  description = "Región de AWS donde está desplegado"
  value       = var.aws_region
}