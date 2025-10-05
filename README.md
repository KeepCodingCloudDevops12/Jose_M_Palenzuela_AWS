# 🚀 Práctica Final AWS - Website Estático en S3

[![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![S3](https://img.shields.io/badge/Amazon%20S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white)](https://aws.amazon.com/s3/)

**Práctica Final del módulo AWS de KeepCoding**  
Despliegue de un website estático en Amazon S3 usando Terraform como Infrastructure as Code (IaC)

---

## 📋 Tabla de Contenidos

- [Descripción](#-descripción)
- [Arquitectura](#️-arquitectura)
- [Requisitos Previos](#-requisitos-previos)
- [Instalación](#-instalación-paso-a-paso)
- [Despliegue](#-despliegue)
- [Verificación](#-verificación)
- [Limpieza](#-limpieza-de-recursos)
- [Personalización](#-personalización)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Troubleshooting](#-troubleshooting)
- [FAQs](#-faqs)

---

## 🎯 Descripción

Este proyecto despliega automáticamente una **web estática** en **Amazon S3** utilizando **Terraform**. La infraestructura se crea en la región de **Irlanda (eu-west-1)** y está configurada para servir contenido HTML públicamente a través de HTTP.

### ✨ Características

- ✅ **Infraestructura como Código** con Terraform
- ✅ **Despliegue automatizado** en AWS S3
- ✅ **Web estática funcional** con páginas personalizadas
- ✅ **Acceso público** configurado correctamente
- ✅ **Página de error 404** personalizada
- ✅ **Código modularizado** siguiendo best practices
- ✅ **Documentación completa**

---

## 🏗️ Arquitectura

```
                          ┌────────────────────────────────────────────────┐
                          │                                                │
                          │              REGIÓN: eu-west-1                 │
                          │                  (Irlanda)                     │
                          │                                                │
                          │  ┌──────────────────────────────────────────┐  │
                          │  │         Amazon S3 Bucket                 │  │
                          │  │  ┌────────────────────────────────────┐  │  │
                          │  │  │  Static Website Hosting            │  │  │
                          │  │  │  • index.html (página principal)   │  │  │
                          │  │  │  • error.html (página 404)         │  │  │
                          │  │  │  • Acceso público configurado      │  │  │
                          │  │  └────────────────────────────────────┘  │  │
                          │  └──────────────────────────────────────────┘  │
                          │                        ▲                       │
                          └────────────────────────┼───────────────────────┘
                                                   │
                                             Petición HTTP
                                                   │
                                          ┌────────┴────────┐
                                          │   Navegador     │
                                          │   (Usuario)     │
                                          └─────────────────┘
```

### 🔧 Componentes Técnicos

| Componente | Descripción |
|------------|-------------|
| **AWS S3** | Bucket configurado como static website hosting |
| **Terraform** | IaC para automatizar el despliegue |
| **HTML/CSS** | Páginas web estáticas |
| **Región** | eu-west-1 (Irlanda) |
| **Acceso** | Público vía HTTP |

---

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado y configurado lo siguiente:

### 1️⃣ Terraform

**Versión requerida:** >= 1.0

#### Instalación:

**Linux (Ubuntu/Debian):**
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

**Verificar instalación:**
```bash
terraform --version
# Debería mostrar: Terraform v1.x.x
```

### 2️⃣ AWS CLI

**Versión requerida:** >= 2.0

#### Instalación:

**Linux:**
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**Verificar instalación:**
```bash
aws --version
# Debería mostrar: aws-cli/2.x.x
```

### 3️⃣ Cuenta de AWS

Necesitas una cuenta de AWS activa con:

- **Acceso programático** (Access Key ID y Secret Access Key)
- **Permisos necesarios:**
  - `s3:CreateBucket`
  - `s3:PutObject`
  - `s3:PutBucketPolicy`
  - `s3:PutBucketWebsite`
  - `s3:PutBucketPublicAccessBlock`
  - `s3:DeleteBucket`
  - `s3:DeleteObject`

### 4️⃣ Git (Opcional)

Para clonar el repositorio:

```bash
git --version
```

---

## 🔐 Configuración de Credenciales AWS

### Opción 1: Configuración Interactiva (Recomendada)

```bash
aws configure
```

Te pedirá:
```
AWS Access Key ID [None]: TU_ACCESS_KEY_ID
AWS Secret Access Key [None]: TU_SECRET_ACCESS_KEY
Default region name [None]: eu-west-1
Default output format [None]: json
```

### Opción 2: Variables de Entorno

```bash
export AWS_ACCESS_KEY_ID="tu_access_key"
export AWS_SECRET_ACCESS_KEY="tu_secret_key"
export AWS_DEFAULT_REGION="eu-west-1"
```

### Verificar configuración:

```bash
aws sts get-caller-identity
```

Deberías ver tu Account ID y ARN.

---

## 💾 Instalación Paso a Paso

### Paso 1: Clonar el Repositorio

```bash
# Clonar el repositorio
git clone https://github.com/KeepCodingCloudDevops12/Jose_M_Palenzuela_AWS

# Entrar al directorio
cd KC_AWS_Practica-Final_Jose-Palenzuela
```

### Paso 2: Verificar la Estructura

```bash
# Listar archivos
ls -la

# Deberías ver:
# provider.tf
# variables.tf
# s3_bucket.tf
# s3_objects.tf
# outputs.tf
# terraform.tfvars.example
# .gitignore
# README.md
# website/
#   ├── index.html
#   └── error.html
```

### Paso 3: (Opcional) Personalizar Variables

Si quieres cambiar la configuración por defecto:

```bash
# Renombrar el archivo de ejemplo
mv terraform.tfvars.example terraform.tfvars

# Editar con tu editor favorito
nano terraform.tfvars
```

**Ejemplo de personalización:**

```hcl
aws_region     = "eu-west-1"                    # Cambiar si quieres otra región
bucket_prefix  = "mi-web-personalizada"         # Cambiar el prefijo del bucket
project_name   = "Mi Proyecto AWS"              # Cambiar el nombre del proyecto
```

> 💡 **Nota:** Si no creas el archivo `terraform.tfvars`, se usarán los valores por defecto de `variables.tf`

---

## 🚀 Despliegue

### Paso 1: Inicializar Terraform

Este comando descarga los providers necesarios (AWS y Random):

```bash
terraform init
```

**Salida esperada:**
```
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 5.0"...
- Finding hashicorp/random versions matching "~> 3.5"...
- Installing hashicorp/aws v5.x.x...
- Installing hashicorp/random v3.x.x...

Terraform has been successfully initialized!
```

### Paso 2: Validar la Configuración

Verifica que no haya errores de sintaxis:

```bash
terraform validate
```

**Salida esperada:**
```
Success! The configuration is valid.
```

### Paso 3: Ver el Plan

Revisa qué recursos se crearán **sin aplicar cambios**:

```bash
terraform plan
```

**Deberías ver:**
```
Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_arn       = (known after apply)
  + bucket_name      = (known after apply)
  + region           = "eu-west-1"
  + website_domain   = (known after apply)
  + website_endpoint = (known after apply)
```

### Paso 4: Aplicar la configuración

Despliega la infraestructura:

```bash
terraform apply
```

Se te pedirá confirmación:
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 
```

**Escribe `yes` y presiona Enter.**

**Proceso de despliegue (1-2 minutos):**
```
random_id.bucket_suffix: Creating...
random_id.bucket_suffix: Creation complete after 0s
aws_s3_bucket.static_website: Creating...
aws_s3_bucket.static_website: Creation complete after 2s
aws_s3_bucket_website_configuration.static_website_config: Creating...
aws_s3_bucket_public_access_block.static_website_pab: Creating...
...
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
```

### Paso 5: Obtener la URL del Website

Al finalizar, verás los **outputs**:

```
Outputs:

bucket_arn = "arn:aws:s3:::bucket-practica-final-aws-a1b2c3d4"
bucket_name = "bucket-practica-final-aws-a1b2c3d4"
region = "eu-west-1"
website_domain = "bucket-practica-final-aws-a1b2c3d4.s3-website-eu-west-1.amazonaws.com"
website_endpoint = "http://bucket-practica-final-aws-a1b2c3d4.s3-website-eu-west-1.amazonaws.com"
```

**🎉 ¡Tu website está desplegado!**

Copia la URL de `website_endpoint` y ábrela en tu navegador.

---

## ✅ Verificación

### 1. Verificar en el Navegador

```bash
# Abrir automáticamente (macOS)
open $(terraform output -raw website_endpoint)

# Abrir automáticamente (Linux)
xdg-open $(terraform output -raw website_endpoint)

# Abrir automáticamente (Windows - PowerShell)
Start-Process (terraform output -raw website_endpoint)
```

**O copia manualmente la URL del output `website_endpoint`**

### 2. Probar con cURL

```bash
# Probar página principal
curl $(terraform output -raw website_endpoint)

# Probar página de error 404
curl $(terraform output -raw website_endpoint)/pagina-inexistente
```

### 3. Verificar en AWS Console

1. Ve a: https://console.aws.amazon.com/s3/
2. Busca el bucket con prefijo `bucket-practica-final-aws-`
3. Ve a la pestaña **Properties** → **Static website hosting**
4. Verifica que esté **Enabled**

### 4. Ver Outputs en Cualquier Momento

```bash
# Ver todos los outputs
terraform output

# Ver solo el endpoint
terraform output website_endpoint

# Ver sin comillas
terraform output -raw website_endpoint
```

---

## 💡 Uso del Website

### Página Principal

Accede a la URL base para ver la página principal con información del despliegue:

```
http://bucket-practica-final-aws-XXXXXXXX.s3-website-eu-west-1.amazonaws.com
```

### Página de Error 404

Intenta acceder a cualquier página que no existe para ver el error personalizado:

```
http://bucket-practica-final-aws-XXXXXXXX.s3-website-eu-west-1.amazonaws.com/no-existe
```

---

## 🧹 Limpieza de Recursos

⚠️ **IMPORTANTE:** Para evitar costos, elimina todos los recursos cuando termines.

### Opción 1: Con Confirmación

```bash
terraform destroy
```

Se te pedirá confirmación:
```
Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value:
```

**Escribe `yes` y presiona Enter.**

### Opción 2: Sin Confirmación (Automático)

```bash
terraform destroy -auto-approve
```

**Proceso de eliminación:**
```
aws_s3_object.error: Destroying...
aws_s3_object.index: Destroying...
aws_s3_object.error: Destruction complete after 1s
aws_s3_object.index: Destruction complete after 1s
aws_s3_bucket_policy.static_website_policy: Destroying...
...
Destroy complete! Resources: 7 destroyed.
```

### Verificar Eliminación

```bash
# Verificar en AWS CLI
aws s3 ls | grep bucket-practica-final-aws

# No debería mostrar ningún bucket
```

---

## 🎨 Personalización

### Cambiar el Contenido HTML

1. Edita los archivos en `website/`:
   ```bash
   nano website/index.html
   nano website/error.html
   ```

2. Aplica los cambios:
   ```bash
   terraform apply
   ```

Terraform detectará automáticamente los cambios (gracias al `etag`) y subirá los archivos actualizados.

### Cambiar la Región

Edita `variables.tf` o crea `terraform.tfvars`:

```hcl
aws_region = "us-east-1"  # Virginia
# o
aws_region = "eu-central-1"  # Frankfurt
```

Luego:
```bash
terraform apply
```

### Añadir más Archivos (CSS, JS, Imágenes)

1. Coloca los archivos en `website/`:
   ```bash
   mkdir website/css website/js website/images
   cp mi-estilo.css website/css/
   ```

2. Añade recursos en `s3_objects.tf`:
   ```hcl
   resource "aws_s3_object" "css" {
     bucket       = aws_s3_bucket.static_website.id
     key          = "css/style.css"
     source       = "website/css/style.css"
     content_type = "text/css"
     etag         = filemd5("website/css/style.css")
   }
   ```

3. Aplica:
   ```bash
   terraform apply
   ```

### Cambiar el Prefijo del Bucket

Edita `terraform.tfvars`:

```hcl
bucket_prefix = "mi-proyecto-web"
```

> ⚠️ Esto creará un bucket nuevo. Destruye el anterior primero si ya existe.

---

## 📂 Estructura del Proyecto

```
practica_final/
│
├── 📄 provider.tf               # Configuración de providers (AWS, Random)
├── 📄 variables.tf              # Definición de todas las variables
├── 📄 s3_bucket.tf              # Bucket S3, configuración y políticas
├── 📄 s3_objects.tf             # Objetos a subir al bucket
├── 📄 outputs.tf                # Outputs mostrados tras el despliegue
├── 📄 terraform.tfvars.example  # Ejemplo de valores de variables
├── 📄 .gitignore                # Archivos a ignorar en Git
├── 📄 README.md                 # Esta documentación
│
└── 📁 website/                  # Contenido del sitio web
    ├── 📄 index.html            # Página principal
    └── 📄 error.html            # Página de error 404
```

### Descripción de Archivos

| Archivo | Propósito |
|---------|-----------|
| `provider.tf` | Define los providers de Terraform (AWS y Random) y sus versiones |
| `variables.tf` | Declara todas las variables configurables del proyecto |
| `s3_bucket.tf` | Crea el bucket S3 y configura el website hosting, acceso público y políticas |
| `s3_objects.tf` | Sube los archivos HTML al bucket |
| `outputs.tf` | Define qué información se muestra después del despliegue |
| `terraform.tfvars.example` | Plantilla para personalizar variables (opcional) |
| `.gitignore` | Excluye archivos sensibles y temporales de Git |

---

## 🐛 Troubleshooting

### Error: "BucketAlreadyExists"

**Problema:** El nombre del bucket ya existe (los nombres son únicos globalmente).

**Solución:**
```bash
# Cambiar el prefijo en terraform.tfvars
bucket_prefix = "mi-nombre-unico-123"

# Aplicar de nuevo
terraform apply
```

### Error: "AccessDenied"

**Problema:** Credenciales AWS incorrectas o sin permisos.

**Solución:**
```bash
# Verificar credenciales
aws sts get-caller-identity

# Reconfigurar
aws configure
```

### Error: "No such file or directory: website/index.html"

**Problema:** Los archivos HTML no están en la ubicación correcta.

**Solución:**
```bash
# Verificar estructura
ls -R

# Debe existir:
# website/index.html
# website/error.html

# Si no existen, créalos o clona el repo de nuevo
```

### El Website no Carga

**Posibles causas:**

1. **Propagación en curso** → Espera 1-2 minutos
2. **Caché del navegador** → Usa modo incógnito (Ctrl+Shift+N)
3. **URL incorrecta** → Verifica que copies toda la URL del output

**Solución:**
```bash
# Ver la URL exacta
terraform output website_endpoint

# Probar con curl
curl $(terraform output -raw website_endpoint)
```

### Error 403 Forbidden

**Problema:** La política del bucket no está aplicada correctamente.

**Solución:**
```bash
# Destruir y recrear
terraform destroy
terraform apply
```

### Terraform se Queda "Colgado"

**Problema:** Proceso interrumpido o lock del estado.

**Solución:**
```bash
# Forzar unlock (solo si estás seguro que no hay otro proceso)
terraform force-unlock LOCK_ID

# Si persiste, elimina archivos de estado local
rm .terraform.lock.hcl
rm -rf .terraform
terraform init
```

---

## ❓ FAQs

### ¿Cuánto cuesta esto?

**Costos estimados (región eu-west-1):**
- Almacenamiento: ~$0.023 por GB/mes
- Requests GET: ~$0.0004 por 1,000 requests
- Transferencia: Primeros 100 GB gratis/mes

**Para esta práctica:** < $0.05/mes (prácticamente gratis)

💡 **Tip:** Usa la capa gratuita de AWS (primer año).

### ¿Por qué HTTP y no HTTPS?

S3 Static Website Hosting solo soporta HTTP directamente. Para HTTPS necesitas:
- Amazon CloudFront (CDN)
- AWS Certificate Manager (SSL)

Esto está fuera del scope de esta práctica básica.

### ¿Puedo usar mi propio dominio?

Sí, pero requiere:
1. Registrar un dominio (Route 53 o externo)
2. Configurar Route 53 para DNS
3. Opcionalmente, CloudFront para HTTPS

### ¿El bucket es privado o público?

**Público** para lectura (`s3:GetObject`). Esto es necesario para servir el website. Los usuarios pueden ver el contenido pero no pueden:
- Listar los archivos del bucket
- Subir archivos
- Eliminar archivos
- Modificar configuración

### ¿Qué pasa si ejecuto `terraform apply` dos veces?

Si no hay cambios, no hará nada:
```
No changes. Your infrastructure matches the configuration.
```

### ¿Puedo usar esto en producción?

Esta es una configuración básica para aprendizaje. Para producción considera:
- ✅ Añadir CloudFront para HTTPS y CDN
- ✅ Configurar logging del bucket
- ✅ Habilitar versioning
- ✅ Añadir backup/replicación
- ✅ Implementar CI/CD
- ✅ Usar Terraform workspaces o remote state

### ¿Cómo actualizo el contenido del website?

```bash
# 1. Edita los archivos HTML
nano website/index.html

# 2. Terraform detecta los cambios automáticamente
terraform apply

# 3. Listo! (limpia la caché del navegador si no ves cambios)

```
