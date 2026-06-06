variable "city" {
  description = "City name"
  type        = string
  default     = "Bangalore"
}


output "cityname" {
  value = var.city
  
}