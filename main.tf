resource "azapi_resource" "rbac_admin" {
  type      = "Microsoft.Authorization/roleAssignments@2022-04-01"
  name      = local.guid
  parent_id = var.scope
  body = jsonencode({
    properties = {
      condition        = local.condition_string
      conditionVersion = "2.0"
      description      = var.description
      principalId      = var.object_id_to_be_added_to_rbac_admin_role
      principalType    = var.principal_type
      roleDefinitionId = local.role_definition_id
    }
  })
}
