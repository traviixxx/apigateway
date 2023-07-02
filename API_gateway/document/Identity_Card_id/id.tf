#1

resource "aws_api_gateway_resource" "rest_api_Idresource" {
  rest_api_id = var.DemoAPI
  parent_id = var.CardParent
  path_part = var.path_part
}

#2method_request

resource "aws_api_gateway_method" "rest_api_Idget_method" {
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Idresource.id
  http_method = each.key
  authorization = "NONE"
  request_parameters = var.method_parameters
//cho nguoi dung dinh nghia, trung thi printout
}
#3integration_method_request

resource "aws_api_gateway_integration" "rest_api_Idget_methvod_integration" {
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Idresource.id
  http_method = each.key
  type        = "MOCK"
  request_templates = {
    "application/json" = jsonencode({
      statusCode = 200
    })
    "application/json" = jsonencode({
      statusCode = 400
    })
  }
  request_parameters = var.integration_Idparameters
//cho nguoi dung dinh nghia, trung thi printout
#  {
#    "integration.request.path.id" = "method.request.path.id"
#  }
}

#4method_response

resource "aws_api_gateway_method_response" "rest_api_Idget_method_response_200"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Idresource.id
  http_method = each.key
  status_code = var.sCode_1
}

resource "aws_api_gateway_method_response" "rest_api_Idget_method_response_400"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Idresource.id
  http_method = each.key
  status_code = var.sCode_2
}

#5integration_method_response

resource "aws_api_gateway_integration_response" "rest_api_Idget_method_integration_response_Delete_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Idresource.id
  http_method = "DELETE"
  status_code = "200"
  response_templates = {
    "application/json" = jsonencode({
      body = "HSuccess!"
    })  
  }
} 

resource "aws_api_gateway_integration_response" "rest_api_Idget_method_integration_response_Get_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Idresource.id
  http_method = "GET"
  status_code = "400"
  response_templates = {
    "application/json" = jsonencode({
      body = "Fail message!"
    })  
  }
}