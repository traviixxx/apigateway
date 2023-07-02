output "DemoAPI" {
    value = aws_api_gateway_rest_api.DemoAPI.id
}

output "DemoAPIroot" {
    value = aws_api_gateway_rest_api.DemoAPI.root_resource_id
}