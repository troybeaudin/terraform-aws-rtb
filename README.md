# terraform-aws-rtb
A Terraform module to create AWS Route Tables and routes for VPC and subnet connectivity

## Usage
 ```hcl
 module "private_rtb" {
  source           = "./terraform-aws-rtb"
  vpc_id           = module.main_vpc.vpc_id
  route_table_name = "Private Route Table"

  subnet_ids = [module.main_vpc.private_subnets["dev-private-b"].id, module.main_vpc.private_subnets["dev-private-a"].id]

  aws_route = {
    private_route = {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = module.main_vpc.nat_gw["dev-public-c"].id
    }
  }

  tags = { Environment = "Test", Type = "Private" }
}
```

*This module create the following resources:
*Routes

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.40 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.40 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_aws_route"></a> [aws\_route](#input\_aws\_route) | n/a | `any` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"Test"` | no |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | n/a | `string` | `"Test Route Table"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->