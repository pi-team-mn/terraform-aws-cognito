provider "aws" {
  region = "eu-central-1"
}
module "pool" {
  source = "../pool"

  pool_name = "pi-pool-test"
}

module "machines" {
  source = "../clients"

  pool_name       = module.pool.user_pool_name
  project_name    = "pi-team-pool-test"
  resource_name   = "test-resource"
  resource_scopes = {
    "test_read": "Read a test file"
  }
  users           = [
    {
      name: "test",
      scopes: []
    }
  ]
}

output "signing_keys" {
  value = module.pool.endpoint_signing_key_url
}
