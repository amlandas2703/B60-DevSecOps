variable "cityname" {
  description = "Name of the city"
  type        = string
}

output "cityname" {
  value = var.cityname
}


variable "vegetable" {
  description = "Name of the vegetable"
  type        = list(string)
  
}

output "veg_name" {
  value = var.vegetable[2]
  
}