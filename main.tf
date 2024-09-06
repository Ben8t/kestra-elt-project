terraform {
  required_providers {
    kestra = {
      source  = "kestra-io/kestra" # namespace of Kestra provider
      version = "~> 0.18.2"         # version of Kestra Terraform provider, not the version of Kestra
    }
    neon = {
      source = "kislerdm/neon"
    }
  }
}

