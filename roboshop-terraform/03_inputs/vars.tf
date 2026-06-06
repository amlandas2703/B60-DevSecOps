variable "cityname" {
  description = "Name of the city"
  type        = string
}

output "cityname" {
  value = var.cityname
}