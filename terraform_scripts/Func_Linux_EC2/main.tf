locals {
  value = "MyAppService"
}

variable "my_list_of_strings" {
  type = list(string)
  default = [ "service1", "service2", "service3", "service4" ]
}

output "my_output" {
  value = upper(local.value)
}