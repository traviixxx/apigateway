variable "region" {
  type        = string
  description = "The region in which to create/manage resources"
  default     = "ap-northeast-1"
}

variable "integration_Idparameters" {
  type = map(string)
  default = {
    "integration.request.path.id" = "method.request.path.id"
  }
}

variable "integration_CsIdparameters" {
  type = map(string)
  default = {
    "integration.request.querystring.pagenum"  = "method.request.querystring.pagenum"
    "integration.request.querystring.pagesize" = "method.request.querystring.pagesize"
    "integration.request.path.customerid"      = "method.request.path.customerid"   
  }
}

variable "method_parameters" {
  type = map(string)
  default = {
    "method.request.path.id" = true
  }
}

variable "method_CsIdparameters" {
  type = map(string)
  default = {
    "method.request.path.customerid"      = true
    "method.request.querystring.pagenum"  = true
    "method.request.querystring.pagesize" = true   
  }
}