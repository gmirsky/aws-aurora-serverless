provider "aws" {
  version = "~> 2.55"
  region  = var.region
}

provider "random" {
  version = "~> 2.2"
}