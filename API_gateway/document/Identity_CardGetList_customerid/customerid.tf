
resource "aws_api_gateway_resource" "rest_api_GetListresource" {
  rest_api_id = var.DemoAPI
  parent_id = var.CardParent
  path_part = "GetList"
}

resource "aws_api_gateway_resource" "rest_api_Customeridresource" {
  rest_api_id = var.DemoAPI
  parent_id = aws_api_gateway_resource.rest_api_GetListresource.id
  path_part = "{customerid}"
}

#method_request

resource "aws_api_gateway_method" "rest_api_Customeridget_method"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Customeridresource.id
  http_method = each.key
  authorization = "NONE"
  request_parameters = var.method_CsIdparameters
}
#integration_method_request

resource "aws_api_gateway_integration" "rest_api_Customeridget_method_integration" {
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Customeridresource.id
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
  request_parameters = var.integration_CsIdparameters
}

#method_response

resource "aws_api_gateway_method_response" "rest_api_Customeridget_method_response_code_200"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Customeridresource.id
  http_method = each.key
  status_code = var.sCode_1
}

resource "aws_api_gateway_method_response" "rest_api_Customeridget_method_response_code_400"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Customeridresource.id
  http_method = each.key
  status_code = var.sCode_2
}

#integration_method_response

resource "aws_api_gateway_integration_response" "rest_api_Customeridget_method_integration_response_OPTION_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Customeridresource.id
  http_method = "OPTIONS"
  status_code = "200"
  response_templates = {
    "application/json" = jsonencode({
      body = "POST OPTIONS"
    })
  }
} 

resource "aws_api_gateway_integration_response" "rest_api_Customeridget_method_integration_GET_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Customeridresource.id
  http_method = "GET"
  status_code = "200"
  response_templates = {
    "application/json" = jsonencode({
      body = "Success!"
    })  
  }
} 
