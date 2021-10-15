variable "main_domain" {
  description = "Parent domain name for the Route53 zone"
}

variable "sub_domain" {
  description = "Sub domain name for the Route53 zone"
}

variable "name_servers" {
  description = "Input name servers"
  type = list
}