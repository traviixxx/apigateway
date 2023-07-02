
resource "aws_api_gateway_resource" "rest_api_Cardresource" {
  rest_api_id = var.DemoAPI
  parent_id = var.DemoAPIroot
  path_part = var.parent_path
}

#method_request

resource "aws_api_gateway_method" "rest_api_Cardget_method"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Cardresource.id
  http_method = each.key
  authorization = "NONE"
}  

#integration_method_request

resource "aws_api_gateway_integration" "rest_api_Cardget_method_integration" {
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Cardresource.id
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
}

#method_response

resource "aws_api_gateway_method_response" "rest_api_Cardget_method_response_code_200"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Cardresource.id
  http_method = each.key
  status_code = var.sCode_1
}

resource "aws_api_gateway_method_response" "rest_api_Cardget_method_response_code_400"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}","${var.toset_value_3}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Cardresource.id
  http_method = each.key
  status_code = var.sCode_2
}
#integration_method_response

resource "aws_api_gateway_integration_response" "rest_api_Cardget_method_integration_response_GET_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Cardresource.id
  http_method = "GET"
  status_code = "200"
  response_templates = {
    "application/json" = jsonencode({
      body = "Hello from the movies API!"
    })  
  }
} 

resource "aws_api_gateway_integration_response" "rest_api_Cardget_method_integration_response_OPTIONS_400" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Cardresource.id
  http_method = "OPTIONS"
  status_code = "400"
  response_templates = {
    "application/json" = jsonencode({
      body = "POST GET OPTIONS"
    })  
  }
} 

resource "aws_api_gateway_integration_response" "rest_api_Cardget_method_integration_response_POST_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Cardresource.id
  http_method = "POST"
  status_code = "200"
  response_templates = {
    "application/json" = jsonencode({
      body = "Success!"
    })  
  }
} 