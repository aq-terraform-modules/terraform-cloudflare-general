terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

data "cloudflare_zone" "main_domain" {
  name = var.main_domain
}

resource "cloudflare_record" "aws_subdomain_dns" {
  count      = length(var.name_servers)
  zone_id    = data.cloudflare_zone.main_domain.id
  name       = "${var.sub_domain}"
  value      = var.name_servers[count.index]
  type       = "NS"
}
