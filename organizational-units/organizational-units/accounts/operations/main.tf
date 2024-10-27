module "my_s3" {
  source = "../../modules/s3-public-access-blocked/v1"
  name   = "test-bucket-operations"
}
