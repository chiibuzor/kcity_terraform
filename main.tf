provider "aws" {
  region = var.primary_region
}

module "network" {
  source         = "./modules/network"
  primary_region = var.primary_region
  secondary_region = var.secondary_region
}

module "s3" {
  source = "./modules/s3"
  primary_region  = var.primary_region
  secondary_region = var.secondary_region
  bucket_names = ["frontend-app-react", "frontend-app-svelte"]
}

module "ecs" {
  source         = "./modules/ecs"
  cluster_name   = "knowledgecity-cluster"
  service_names  = ["monolithic-api", "reporting-service"]
  task_cpu       = 256
  task_memory    = 512
  desired_count  = 2
}

module "aurora" {
  source       = "./modules/aurora"
  db_name      = "knowledgecity"
  db_username  = "admin"
  db_password  = var.db_password
  global_regions = [var.primary_region, var.secondary_region]
}

module "cloudfront" {
  source         = "./modules/cloudfront"
  origin_bucket  = module.s3.bucket_arn
  domain_name    = "knowledgecity.com"
}

module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source         = "./modules/lambda"
  function_name  = "media-encryption"
  handler        = "handler.lambda_handler"
  runtime        = "python3.9"
  memory_size    = 256
  timeout        = 30
}
