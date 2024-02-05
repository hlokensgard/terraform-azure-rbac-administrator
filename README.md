# Role Based Access Control Administrator
## Information
A Terraform module that will help you create role assignment for the role Role Based Access Control Administrator. This role allows you to manage Azure RBAC roles and assignments. It can be easy to set up in the Azure portal but rather hard to configure the same in Terraform. This module will help you to do that.

For more information on the role, please visit the [Azure Documentation]()

## Usage
### Example Constrain Roles

```
module "rbac_admin" {
  source = "..."
scope = "/subscriptions/00000000-0000-0000-0000-000000000000"
role_id_to_assign = "acdd72a7-3385-48ef-bd42-f606fba81ae7" # Reader
object_id_to_be_added_to_rbac_admin_role = "00000000-0000-0000-0000-000000000000" # Object ID of the user to be added
principal_type = "User"
constrain_roles = true
}
```

### Example constrain_roles_and_principal_types
```
module "rbac_admin" {
  source = "..."
scope = "/subscriptions/00000000-0000-0000-0000-000000000000"
role_id_to_assign = "acdd72a7-3385-48ef-bd42-f606fba81ae7" # Reader
object_id_to_be_added_to_rbac_admin_role = "00000000-0000-0000-0000-000000000000" # Object ID of the group to be added
principal_type = "Group"
user_type = true
group_type = true
constrain_roles_and_principal_types = true
}
```

### Exmaple constrain_roles_and_principals
```
module "rbac_admin" {
  source = "..."
scope = "/subscriptions/00000000-0000-0000-0000-000000000000"
role_id_to_assign = "acdd72a7-3385-48ef-bd42-f606fba81ae7" # Reader
object_id_to_be_added_to_rbac_admin_role = "00000000-0000-0000-0000-000000000000" # Object ID of the user to be added
principal_type = "User"
constrain_roles_and_principals = true
object_ids_that_can_given_the_role = ["00000000-0000-0000-0000-000000000000", "00000000-0000-0000-0000-000000000001"]
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | 1.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.testing](https://registry.terraform.io/providers/Azure/azapi/1.12.0/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_object_id_to_be_added_to_rbac_admin_role"></a> [object\_id\_to\_be\_added\_to\_rbac\_admin\_role](#input\_object\_id\_to\_be\_added\_to\_rbac\_admin\_role) | The object ID of the user, group, or service principal you want to assign the role Role Based Access Control Administrator to. | `string` | n/a | yes |
| <a name="input_role_id_to_assign"></a> [role\_id\_to\_assign](#input\_role\_id\_to\_assign) | The role definition ID to assign. This is the ID of the role you want the users to be able to assign to others. This could be Storage Blob Data Contributor, Virtual Machine Contributor, etc. | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope of the resource. This can be a subscription, resource group, or resource. Most common is an subscription. Example: /subscriptions/00000000-0000-0000-0000-000000000000 | `string` | n/a | yes |
| <a name="input_constrain_roles"></a> [constrain\_roles](#input\_constrain\_roles) | If you want to constrain the role assignment to only be able to assign the role, set this to true | `bool` | `false` | no |
| <a name="input_constrain_roles_and_principal_types"></a> [constrain\_roles\_and\_principal\_types](#input\_constrain\_roles\_and\_principal\_types) | If you want to constrain the role assignment to only be able to assign the role to a specific principal type, set this to true | `bool` | `false` | no |
| <a name="input_constrain_roles_and_principals"></a> [constrain\_roles\_and\_principals](#input\_constrain\_roles\_and\_principals) | If you want to constrain the role assignment to only be able to assign the role to a specific principal, set this to true | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the role assignment. This is just used as meta data and is not required. Example: This role assignment is for... | `string` | `""` | no |
| <a name="input_group_type"></a> [group\_type](#input\_group\_type) | Only in use when constrain\_roles\_and\_principal\_types is set to true. If you want to assign the role to a group, set this to true | `bool` | `false` | no |
| <a name="input_object_ids_that_can_be_given_the_role"></a> [object\_ids\_that\_can\_be\_given\_the\_role](#input\_object\_ids\_that\_can\_be\_given\_the\_role) | Only used when constrain\_roles\_and\_principals is set to true. The object IDs of the users, groups, or service principals that will be given the chosen role. This is a list of object IDs. Example: ["00000000-0000-0000-0000-000000000000", "00000000-0000-0000-0000-000000000001"] | `list(string)` | `[]` | no |
| <a name="input_principal_type"></a> [principal\_type](#input\_principal\_type) | The type of principal you want to assign the role Role Based Access Control Administrator to. This can be User, Group, or ServicePrincipal | `string` | `"User"` | no |
| <a name="input_service_principal_type"></a> [service\_principal\_type](#input\_service\_principal\_type) | Only in use when constrain\_roles\_and\_principal\_types is set to true. If you want to assign the role to a service principal, set this to true | `bool` | `false` | no |
| <a name="input_user_type"></a> [user\_type](#input\_user\_type) | Only in use when constrain\_roles\_and\_principal\_types is set to true. If you want to assign the role to a user, set this to true | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->