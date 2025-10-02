# Subir archivo index.html
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.static_website.id
  key          = var.index_document
  source       = "website/${var.index_document}"
  content_type = "text/html"
  etag         = filemd5("website/${var.index_document}")

  depends_on = [aws_s3_bucket_policy.static_website_policy]
}

# Subir archivo error.html
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.static_website.id
  key          = var.error_document
  source       = "website/${var.error_document}"
  content_type = "text/html"
  etag         = filemd5("website/${var.error_document}")

  depends_on = [aws_s3_bucket_policy.static_website_policy]
}