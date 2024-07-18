terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  # Provider is configured using environment variables:
  # DIGITALOCEAN_TOKEN, DIGITALOCEAN_ACCESS_TOKEN
  # Backup manual CLI prompt in case unable to read DO Token from environment variable
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "demo" {
  name = "k8s-demo"
  region = "nyc3"
  version = "1.30.2-do.0"
  node_pool {
    name = "worker-nodes"
    size = "s-2vcpu-4gb"
    node_count = 3
  }
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.demo.kube_config
  sensitive = true
}