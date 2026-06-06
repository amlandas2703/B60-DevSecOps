variable "fruits" {}





output "appleproperties" {
  value = "The color of apple is ${lookup(var.fruits["apple"],"color","unknown")}, its taste is ${lookup(var.fruits["apple"],"taste", "unknown")}, its price is ${lookup(var.fruits["apple"], "price", "unknown")} dollars and its quantity is ${lookup(var.fruits["apple"],"quantity","unknown")} and it is from ${lookup(var.fruits["apple"], "state", "unknown")}"
  
}

output "banana" {
  value = "The color of banana is ${lookup(var.fruits["banana"],"color","unknown")}, its taste is ${lookup(var.fruits["banana"],"taste", "unknown")}, its price is ${lookup(var.fruits["banana"], "price", "unknown")} dollars and its quantity is ${lookup(var.fruits["banana"],"quantity","unknown")} and it is from ${lookup(var.fruits["banana"], "state", "Karnataka")}"
  
}
  
