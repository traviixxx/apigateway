variable "DemoAPI" {
  type        = string
  description = "The id of the Rest API"
} //value comes from main.tf

variable "CardParent" {
  type        = string
  description = "The id of the parent path"
} //value comes from main.tf

variable "toset_value_1" {
  type        = string
  description = "The method of API"
} //value comes from main.tf

variable "toset_value_2" {
  type        = string
  description = "The method of API"
} //value comes from main.tf

variable "sCode_1" {
  type        = string
  description = "The method of API"
} //value comes from main.tf

variable "sCode_2" {
  type        = string
  description = "The method of API"
} //value comes from main.tf

variable "integration_CsIdparameters" {
  type = map(string)
}

variable "method_CsIdparameters" {
  type = map(string)
}