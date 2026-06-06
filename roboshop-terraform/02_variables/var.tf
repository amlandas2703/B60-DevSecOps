variable "city" {
  description = "City name"
  type        = string
  default     = "Bangalore"
}


output "cityname" {
  value = var.city
  
}

variable "fruits" { 
    description = "List of fruits"
    type        = list(string)
    default     = ["apple", "banana", "orange"]

}

output "my_fruits" {
  value = "My favourite fruit is ${var.fruits[0]}" 
  
}