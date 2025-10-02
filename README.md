# Práctica Final AWS - Website Estático en S3

## 📋 Descripción

Plantilla de Terraform para desplegar un website estático en Amazon S3 en la región de **Irlanda (eu-west-1)**. El bucket está configurado para servir contenido web públicamente.

**Proyecto:** `practica_final`  
**Bootcamp:** Keepcoding AWS  
**Módulo:** AWS

## 🏗️ Arquitectura

- **Región AWS**: eu-west-1 (Irlanda)
- **Servicio**: Amazon S3 Static Website Hosting
- **IaC**: Terraform (modularizado)
- **Contenido**: HTML5 + CSS3
- **Acceso**: Público vía HTTP

## 📁 Estructura del Proyecto

```
practica_final/
├── provider.tf                 # Configuración de providers (AWS, Random)
├── variables.tf                # Definición de variables
├── terraform.tfvars.example    # Ejemplo de valores para variables
├── s3_bucket.tf               # Configuración del bucket S3 y políticas
├── s3_objects.tf              # Objetos/archivos a subir al bucket
├── outputs.tf                 # Outputs de Terraform
├── website/
│   ├── index.html             # Página principal del sitio
│   └── error.html             # Página de error 404 personalizada
├── .gitignore                 # Archivos a ignorar en Git
└── README.md                  # Esta documentación
```

## 🚀 Requisitos Previos

### Software Necesario

1. **Terraform** (versión >= 1.0)
```bash
terraform --version
```

2. **AWS CLI** configurado
```bash
aws configure
```

### Credenciales AWS

Necesitas credenciales AWS con los siguientes permisos:
- `s3:CreateBucket`
- `s3:PutObject`
- `s3:PutBucketPolicy`
- `s3:PutBucketWebsite`
- `s3:PutBucketPublicAccessBlock`

## 📦 Instalación y Despliegue

### Paso 1: Preparar el entorno

```bash
# Crear el directorio del proyecto
mkdir practica_final
cd practica_final

# Crear el subdirectorio para el website
mkdir website
```

### Paso 2: Copiar los archivos

Copia todos los archivos de Terraform en el directorio `practica_final/`:
- `provider.tf`
- `variables.tf`
- `terraform.tfvars.example`
- `s3_bucket.tf`
- `s3_objects.tf`
- `outputs.tf`
- `.gitignore`

Y los archivos HTML en `practica_final/website/`:
- `index.html`
- `error.html`

### Paso 3: (Opcional) Configurar variables personalizadas

```bash
# Copiar el archivo de ejemplo
cp terraform.tfvars.example terraform.tfvars

# Editar con tus valores personalizados (opcional)
nano terraform.tfvars
```

### Paso 4: Inicializar Terraform

```bash
terraform init
```

Este comando descargará los providers necesarios (AWS y Random).

### Paso 5: Validar la configuración

```bash
terraform validate
```

Debe mostrar: `Success! The configuration is valid.`

### Paso 6: Ver el plan de ejecución

```bash
terraform plan
```

Revisa los recursos que se van a crear.

### Paso 7: Aplicar la configuración

```bash
terraform apply
```

Escribe `yes` cuando se te solicite confirmar.

### Paso 8: Obtener el endpoint

Terraform mostrará los outputs al finalizar:

```
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

bucket_arn = "arn:aws:s3:::kp-bt-static-website-abc12345"
bucket_name = "kp-bt-static-website-abc12345"
region = "eu-west-1"
website_domain = "kp-bt-static-website-abc12345.s3-website-eu-west-1.amazonaws.com"
website_endpoint = "http://kp-bt-static-website-abc12345.s3-website-eu-west-1.amazonaws.com"
```

## 🌐 Acceso al Website

Abre la URL del output `website_endpoint` en tu navegador.

**💡 Tip Importante**: Usa un navegador en **modo incógnito** para evitar problemas de caché durante las pruebas.

## 🧪 Probar el Website

### Página Principal
```bash
# Copiar la URL del output website_endpoint
curl http://kp-bt-static-website-XXXXX.s3-website-eu-west-1.amazonaws.com
```

### Página de Error 404
```bash
# Intentar acceder a una página que no existe
curl http://kp-bt-static-website-XXXXX.s3-website-eu-west-1.amazonaws.com/pagina-inexistente
```

## 🧹 Limpieza de Recursos

⚠️ **Importante**: Para evitar costos, elimina los recursos cuando termines:

```bash
terraform destroy
```

Escribe `yes` para confirmar la eliminación.

## 📝 Recursos Creados en AWS

Esta plantilla crea automáticamente:

1. **random_id.bucket_suffix** - ID aleatorio para nombre único
2. **aws_s3_bucket.static_website** - Bucket S3
3. **aws_s3_bucket_website_configuration.static_website_config** - Configuración de website
4. **aws_s3_bucket_public_access_block.static_website_pab** - Configuración de acceso público
5. **aws_s3_bucket_policy.static_website_policy** - Política de bucket
6. **aws_s3_object.index** - Archivo index.html
7. **aws_s3_object.error** - Archivo error.html

## 📂 Descripción de Archivos Terraform

| Archivo | Descripción |
|---------|-------------|
| `provider.tf` | Configuración de providers AWS y Random |
| `variables.tf` | Definición de todas las variables |
| `s3_bucket.tf` | Creación y configuración del bucket S3 |
| `s3_objects.tf` | Upload de archivos al bucket |
| `outputs.tf` | Outputs mostrados tras el despliegue |
| `terraform.tfvars.example` | Plantilla de variables (opcional) |

## 🔧 Variables Configurables

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `aws_region` | Región de AWS | `eu-west-1` (Irlanda) |
| `project_name` | Nombre del proyecto | `Keepcoding AWS Bootcamp` |
| `environment` | Ambiente | `bootcamp` |
| `bucket_prefix` | Prefijo del bucket | `kp-bt-static-website` |
| `index_document` | Documento index | `index.html` |
| `error_document` | Documento de error | `error.html` |

### Personalizar Variables

Crea un archivo `terraform.tfvars`:

```hcl
aws_region     = "eu-west-1"
bucket_prefix  = "mi-website-bootcamp"
project_name   = "Mi Proyecto AWS"
```

## 📊 Outputs Disponibles

Después del despliegue, obtendrás:

| Output | Descripción | Ejemplo |
|--------|-------------|---------|
| `website_endpoint` | URL completa del website | `http://bucket.s3-website-eu-west-1.amazonaws.com` |
| `bucket_name` | Nombre del bucket | `kp-bt-static-website-abc12345` |
| `bucket_arn` | ARN del bucket | `arn:aws:s3:::kp-bt-static-website-abc12345` |
| `website_domain` | Dominio sin protocolo | `bucket.s3-website-eu-west-1.amazonaws.com` |
| `region` | Región del despliegue | `eu-west-1` |

Para ver los outputs después del despliegue:

```bash
terraform output
terraform output website_endpoint
```

## 🎨 Personalización

### Modificar el Contenido HTML

Edita los archivos en `website/`:
- `website/index.html` - Página principal
- `website/error.html` - Página de error

Luego aplica los cambios:

```bash
terraform apply
```

### Añadir más archivos (CSS, JS, imágenes)

1. Coloca los archivos en `website/`
2. Añade recursos en `s3_objects.tf`:

```hcl
resource "aws_s3_object" "style" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "style.css"
  source       = "website/style.css"
  content_type = "text/css"
  etag         = filemd5("website/style.css")
}

resource "aws_s3_object" "logo" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "images/logo.png"
  source       = "website/images/logo.png"
  content_type = "image/png"
  etag         = filemd5("website/images/logo.png")
}
```

### Cambiar la Región

Edita `terraform.tfvars` o modifica directamente `variables.tf`:

```hcl
variable "aws_region" {
  default = "us-east-1"  # Cambiar a la región deseada
}
```

## 🐛 Resolución de Problemas

### Error: "BucketAlreadyExists"

**Causa**: El nombre del bucket ya existe globalmente en AWS.

**Solución**: El random_id debería evitar esto, pero si ocurre, cambia el `bucket_prefix`:

```hcl
bucket_prefix = "mi-nuevo-prefijo"
```

### Error: "Error reading website/index.html: no such file or directory"

**Causa**: Los archivos HTML no están en la ubicación correcta.

**Solución**: Asegúrate de que la estructura sea:

```
practica_final/
├── (archivos .tf)
└── website/
    ├── index.html
    └── error.html
```

### Error: "AccessDenied" al crear el bucket

**Causa**: Credenciales AWS sin permisos suficientes.

**Solución**: 
1. Verifica tus credenciales: `aws sts get-caller-identity`
2. Asegúrate de tener permisos de S3

### El website no carga o muestra XML

**Causas posibles**:
1. La configuración está propagándose (espera 1-2 minutos)
2. Caché del navegador

**Soluciones**:
- Espera unos minutos
- Usa modo incógnito
- Limpia la caché del navegador
- Verifica la URL completa del output

### Error: "403 Forbidden"

**Causa**: La política del bucket no está aplicada correctamente.

**Solución**:

```bash
# Destruir y recrear
terraform destroy
terraform apply
```

## 📚 Comandos Útiles de Terraform

```bash
# Ver el estado actual
terraform show

# Listar recursos
terraform state list

# Ver un output específico
terraform output website_endpoint

# Formatear código
terraform fmt

# Validar configuración
terraform validate

# Ver plan sin aplicar
terraform plan

# Aplicar cambios
terraform apply

# Aplicar sin confirmación
terraform apply -auto-approve

# Destruir infraestructura
terraform destroy

# Destruir sin confirmación
terraform destroy -auto-approve

# Ver el gráfico de dependencias
terraform graph | dot -Tpng > graph.png
```

## 🔐 Seguridad

### Buenas Prácticas Implementadas

✅ Bucket con nombre único aleatorio  
✅ Política de bucket restrictiva (solo GetObject)  
✅ Tags para identificación  
✅ Variables parametrizadas  
✅ .gitignore para archivos sensibles

### Consideraciones de Seguridad

⚠️ **Este website es público por HTTP**:
- No almacenes información sensible
- Para HTTPS necesitas CloudFront + ACM
- No es apto para datos personales o privados

## 💰 Costos Estimados

**S3 Static Website Hosting** (región eu-west-1):
- Almacenamiento: ~$0.023 por GB/mes
- Requests GET: ~$0.0004 por 1,000 requests
- Transferencia de datos: Primeros 100 GB gratis/mes

**Ejemplo**: Website con 2 archivos HTML (~10 KB) y 1,000 visitas/mes:
- Almacenamiento: < $0.01/mes
- Requests: < $0.01/mes
- **Total estimado: < $0.02/mes**

💡 **Tip**: Usa la capa gratuita de AWS durante el primer año.

## 🧪 Testing

### Test Manual

1. Accede al `website_endpoint`
2. Verifica que carga la página principal
3. Intenta acceder a `/pagina-inexistente` para ver el error 404
4. Verifica que el diseño se ve correctamente

### Test desde Terminal

```bash
# Obtener el endpoint
ENDPOINT=$(terraform output -raw website_endpoint)

# Probar página principal
curl -I $ENDPOINT

# Probar página de error
curl -I $ENDPOINT/no-existe

# Ver contenido HTML
curl $ENDPOINT
```

## 📖 Recursos y Referencias

### Documentación Oficial

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [Terraform Documentation](https://www.terraform.io/docs)

### Tutoriales Útiles

- [AWS S3 Best Practices](https://docs.aws.amazon.com/AmazonS3/latest/userguide/security-best-practices.html)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)

## 🎯 Checklist de Entrega

Antes de entregar la práctica, verifica:

- [x] ✅ Código Terraform modularizado (múltiples archivos .tf)
- [x] ✅ Despliegue en región Irlanda (eu-west-1)
- [x] ✅ Bucket S3 configurado como static website
- [x] ✅ Acceso público configurado correctamente
- [x] ✅ Output con endpoint de conexión
- [x] ✅ Archivos HTML funcionales incluidos
- [x] ✅ README.md con documentación completa
- [x] ✅ .gitignore configurado
- [x] ✅ Variables parametrizadas
- [x] ✅ Estructura de proyecto organizada
- [x] ✅ Website accesible y funcional

## 🚀 Próximos Pasos (Mejoras Opcionales)

Si quieres ampliar la práctica:

1. **Añadir CloudFront** para HTTPS y CDN
2. **Configurar Route53** para dominio personalizado
3. **Implementar CI/CD** con GitHub Actions
4. **Añadir CloudWatch** para métricas
5. **Versioning del bucket** para backup
6. **Terraform Remote State** en S3

## 🎓 Información del Proyecto

**Proyecto**: Práctica Final AWS  
**Directorio**: `practica_final`  
**Bootcamp**: Keepcoding AWS  
**Módulo**: Amazon Web Services  
**Autor**: [Tu Nombre Aquí]  
**Fecha**: Octubre 2025  
**Instructor**: [Nombre del Instructor]

---

## 📞 Soporte

Si tienes problemas:

1. Revisa la sección de **Resolución de Problemas**
2. Verifica los logs: `terraform apply` muestra errores detallados
3. Consulta la documentación oficial de AWS/Terraform
4. Contacta con el instructor del bootcamp

---

## 📝 Notas Finales

- El bucket S3 tiene nombre único gracias a `random_id`
- Los archivos se suben automáticamente desde `website/`
- El `etag` asegura que los archivos se actualicen si cambian
- La región está parametrizada pero por defecto es eu-west-1
- El proyecto sigue las mejores prácticas de Terraform

**¡Buena suerte con la práctica final!** 🎉