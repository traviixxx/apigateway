//Compress--------------------

resource "aws_api_gateway_resource" "rest_api_Compressresource" {
  rest_api_id = var.DemoAPI
  parent_id = var.CardParent
  path_part = var.path_part
// for_each 1 trong 1 map(string)
}

#method_request

resource "aws_api_gateway_method" "rest_api_Compressget_method"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Compressresource.id
// chỗ này cũng cần 1 for_each >>> 2 for_each lồng nhau
  http_method = each.key
// Xử lý thừa method per path.
  authorization = "NONE"
}
#integration_method_request

resource "aws_api_gateway_integration" "rest_api_Compressget_method_integration" {
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Compressresource.id
// chỗ này cũng cần 1 for_each >>> 2 for_each lồng nhau
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

resource "aws_api_gateway_method_response" "rest_api_Compressget_method_response_code_200"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Compressresource.id
// chỗ này cũng cần 1 for_each >>> 2 for_each lồng nhau
  http_method = each.key
// Xử lý thừa method per path.
  status_code = var.sCode_1
}

resource "aws_api_gateway_method_response" "rest_api_Compressget_method_response_code_400"{
  for_each = toset (["${var.toset_value_1}","${var.toset_value_2}"])
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Compressresource.id
// chỗ này cũng cần 1 for_each >>> 2 for_each lồng nhau
  http_method = each.key
// Xử lý thừa method per path.
  status_code = var.sCode_2
}


#integration_method_response

resource "aws_api_gateway_integration_response" "rest_api_Compressget_method_integration_response_OPTION_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Compressresource.id
// chỗ này vẫn phải định nghĩa riêng, map static 1:1 tfvar all
  http_method = "OPTIONS"
  status_code = "200"
  response_templates = {
    "application/json" = jsonencode({
      body = "POST OPTIONS"
    })
  }
} 

resource "aws_api_gateway_integration_response" "rest_api_Compressget_method_integration_POST_200" {
  rest_api_id = var.DemoAPI
  resource_id = aws_api_gateway_resource.rest_api_Compressresource.id
// chỗ này vẫn phải định nghĩa riêng, map static 1:1 tfvar all
  http_method = "POST"
  status_code = "200"
  response_templates = {
    "application/json" = jsonencode({
      body = "Success!"
    })  
  }
} 