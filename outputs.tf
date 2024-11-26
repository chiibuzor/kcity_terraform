output "vpc_id" {
  value = module.network.vpc_id
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}
