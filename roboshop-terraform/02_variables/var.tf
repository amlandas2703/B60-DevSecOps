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
  value = "My score in hindi is ${var.score["hindi"]}"
  
}


variable "fruits_details" {
  description = "A map of fruits and their details"
  type        = map(object({
    color  = string
    taste  = string
    price  = number
    quantity   = number 
  }))
  default     = {
    apple = {
      color = "red"
      taste = "sweet"
      price = 1.5
      quantity = 10
    }
    banana = {
      color = "yellow"
      taste = "sweet"
      price = 0.5
      quantity = 20
    }
    orange = {
      color = "orange"
      taste = "citrus"
      price = 1.0
      quantity = 15
    }
  }
  
}

output "name_and_price" {
  value = "The price of ${var.fruits_details["apple"].color} apple is ${var.fruits_details["apple"].price} dollars"
  
}

output "name_and_quantity" {
  value = "The quantity of ${var.fruits_details["banana"].color} banana is ${var.fruits_details["banana"].quantity}"
  
}