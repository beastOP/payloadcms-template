provider "google" {
  project = "payloadcms-test"
  region = "ap-south1"
  zone = "ap-south1-a"
}

# Create a storage bucket
resource "google_storage_bucket" "storage" {
  name = "payloadcms-blog-media"
  location = "ASIA-SOUTH1"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}

# # Create a MongoDB Atlas instance
# terraform {
#   required_providers {
#     mongodbatlas = {
#       source = "mongodb/mongodbatlas"
#       version = "1.8.0"
#     }
#   }
# }

# provider "mongodbatlas" {
#   # Configuration options
#   public_key = var.mongodbatlas_public_key
#   private_key  = var.mongodbatlas_private_key
# }

# # Build and deploy the Docker image to GCR
# resource "google_container_registry_image" "image" {
#   name          = "gcr.io/payloadcms-test/blog"
#   build {
#     context    = "."
#     dockerfile = "Dockerfile"
#     tag        = "latest"
#   }
# }

# # Deploy the app to App Engine with environment variables
# resource "google_app_engine_standard_app_version" "default" {
#   service = "blog"
#   runtime = "custom"
#   env_variables = {
#     MONGODB_URI = mongodbatlas_cluster.connection_strings[0]
#     GCS_BUCKET = google_storage_bucket.storage.name
#     GCS_ENDPOINT= google_storage_bucket.storage.url
#     GCS_PROJECT_ID= "payloadcms-test"
#   }

#   # Docker configuration
#   image_url = google_container_registry_image.image.url
#   entrypoint = ["npm", "start"]
# }
