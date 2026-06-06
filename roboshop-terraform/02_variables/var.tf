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
  value = "My favourite fruit is ${var.fruits[2]}" 
  
}

variable "score" {
  description = "A map of subjects and their scores"
  type        = map(number)
  default     = {
    math    = 90,
    science = 85,
    english = 92,
    hindi   = 88
  }
  
}

output "my_score" {
  value = "My score in science is ${var.score["hindi"]}"
  
}