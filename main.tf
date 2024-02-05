resource "azapi_resource" "testing" {
  type      = "Microsoft.Authorization/roleAssignments@2022-04-01"
  name      = local.guid
  parent_id = var.scope
  body = jsonencode({
    properties = {
      condition        = local.conditionString
      conditionVersion = "2.0"
      description      = var.description
      principalId      = var.object_id_of_user_to_be_added
      principalType    = var.principal_type
      roleDefinitionId = local.role_definition_id
    }
  })
}
