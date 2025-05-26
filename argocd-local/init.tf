terraform {
  required_version = "~> 1.8"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17"
    }
  }
}

provider "helm" {
  kubernetes {
    host = "https://0.0.0.0:7893"
    config_path = "~/.kube/config"
    
  }
}

provider "kubernetes" {
  host = "https://0.0.0.0:7893"
  config_path = "~/.kube/config"
}