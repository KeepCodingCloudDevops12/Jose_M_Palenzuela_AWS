# Variables de configuración del proyecto

variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "eu-west-1" # Irlanda
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "Keepcoding Modulo AWS practica final"
}

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
  default     = "bootcamp"
}

variable "bucket_prefix" {
  description = "Prefijo para el nombre del bucket S3"
  type        = string
  default     = "bucket-practica-final-aws"
}

variable "index_document" {
  description = "Nombre del documento index"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Nombre del documento de error"
  type        = string
  default     = "error.html"
}