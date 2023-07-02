terraform{
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.0.0"
        }
    }
}

provider "aws" {
    region = var.region
}

module "ListGateway" {
    source = "./ListGateway"
}

// -------------Template-------------
# Init Root/Parent_path
# Listing Method per path 
# Listing statuscode per method
# Enable Parameters
# Integrate Parameters 

module "Identity_Card" {
    source = "./Identity_Card"
    DemoAPI = module.ListGateway.DemoAPI
    DemoAPIroot = module.ListGateway.DemoAPIroot
    parent_path = "Card"
    toset_value_1 = "OPTIONS"
    toset_value_2 = "GET"
    toset_value_3 = "POST"
    #toset_value_1 = "DELETE"
    #toset_value_2 = "UPDATE"
    #toset_value_3 = "ANY"
    sCode_1 = 200
    sCode_2 = 400
    depends_on = [
        module.ListGateway
    ]
}

module "Identity_Card_id" {
    source = "./Identity_Card_id"
    DemoAPI = module.ListGateway.DemoAPI
    CardParent = module.Identity_Card.CardParent
    path_part = "{id}"
    toset_value_1 = "OPTIONS"
    toset_value_2 = "GET"
    #toset_value_3 = "POST"
    toset_value_3 = "DELETE"
    #toset_value_2 = "UPDATE"
    #toset_value_3 = "ANY"
    sCode_1 = 200
    sCode_2 = 400
    #authori = var
    method_parameters = var.method_parameters
    integration_Idparameters = var.integration_Idparameters
    depends_on = [
        module.Identity_Card
    ]
}

module "Identity_Card_Compress" {
    source = "./Identity_Card_Compress"
    DemoAPI = module.ListGateway.DemoAPI
    CardParent = module.Identity_Card.CardParent
    path_part = "Compress"
    toset_value_1 = "OPTIONS"
    #toset_value_2 = "GET"
    toset_value_2 = "POST"
    #toset_value_3 = "DELETE"
    #toset_value_2 = "UPDATE"
    #toset_value_3 = "ANY"
    sCode_1 = 200
    sCode_2 = 400
    #authori = var
    depends_on = [
        module.Identity_Card
    ]
}

module "Identity_CardGetList_customerid" {
    source = "./Identity_CardGetList_customerid"
    DemoAPI = module.ListGateway.DemoAPI
    CardParent = module.Identity_Card.CardParent
    #path_part = "GetList/{customerid}"
    toset_value_1 = "OPTIONS"
    toset_value_2 = "GET"
    #toset_value_2 = "POST"
    #toset_value_3 = "DELETE"
    #toset_value_2 = "UPDATE"
    #toset_value_3 = "ANY"
    sCode_1 = 200
    sCode_2 = 400
    #authori = var
    method_CsIdparameters = var.method_CsIdparameters
    integration_CsIdparameters = var.integration_CsIdparameters
    depends_on = [
        module.Identity_Card
    ]
}
