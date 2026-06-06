variable "fruitsinfo" {}

output "fruits" {
  value = var.fruitsinfo
}



output "appleproperties" {
  value = "The color of apple is ${var.fruits["apple"].color}, its taste is ${var.fruits["apple"].taste}, its price is ${var.fruits["apple"].price} dollars and its quantity is ${var.fruits["apple"].quantity} and it is from ${var.fruits["apple"].state}"

}

output "bananaproperties" {
  value = "The color of banana is ${var.fruits["banana"].color}, its taste is ${var.fruits["banana"].taste}, its price is ${var.fruits["banana"].price} dollars and its quantity is ${var.fruits["banana"].quantity} and it is from ${var.fruits["banana"].state}"
  
}

  
}