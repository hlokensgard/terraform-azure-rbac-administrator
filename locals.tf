locals {
  guid = uuid()

  # Getting the subscription id from the scope
  subscription_id = split("/", var.scope)[2]
  # The ID is the same as the role definition ID
  # This is a built-in role definition ID
  role_definition_id = "/subscriptions/${local.subscription_id}/providers/Microsoft.Authorization/roleDefinitions/f58310d9-a9f6-439a-9e8d-f62e7b41a168"

  role_id_to_assign      = var.role_id_to_assign
  user_type              = var.user_type == true ? "'User', " : ""
  group_type             = var.group_type == true ? "'Group', " : ""
  service_principal_type = var.service_principal_type == true ? "'ServicePrincipal'" : ""

  list_over_types = trim(trim("${local.user_type}${local.group_type}${local.service_principal_type}", " "), ",")

  # Need to create a string of object IDs in the list from the variable object_ids_that_can_be_given_the_role
  object_ids_that_can_be_given_the_role = join(",", var.object_ids_that_can_be_given_the_role)

  # Creating the condition string
  prefix        = "((!(ActionMatches{'Microsoft.Authorization/roleAssignments/write'})) OR (@Request[Microsoft.Authorization/roleAssignments:RoleDefinitionId] ForAnyOfAnyValues:GuidEquals {${local.role_id_to_assign}}"
  defaultString = "AND ((!(ActionMatches{'Microsoft.Authorization/roleAssignments/delete'})) OR (@Resource[Microsoft.Authorization/roleAssignments:RoleDefinitionId] ForAnyOfAnyValues:GuidEquals {${local.role_id_to_assign}}"



  constrain_roles                     = "${local.prefix})) ${local.defaultString}))"
  constrain_roles_and_principal_types = "${local.prefix} AND @Request[Microsoft.Authorization/roleAssignments:PrincipalType] ForAnyOfAnyValues:StringEqualsIgnoreCase {${local.list_over_types}})) ${local.defaultString} AND @Resource[Microsoft.Authorization/roleAssignments:PrincipalType] ForAnyOfAnyValues:StringEqualsIgnoreCase {${local.list_over_types}}))"
  constrain_roles_and_principals      = "${local.prefix} AND @Request[Microsoft.Authorization/roleAssignments:PrincipalId] ForAnyOfAnyValues:GuidEquals {${local.object_ids_that_can_be_given_the_role}})) ${local.defaultString} AND @Resource[Microsoft.Authorization/roleAssignments:PrincipalId] ForAnyOfAnyValues:GuidEquals {${local.object_ids_that_can_be_given_the_role}}))"

  constrain_roles_enabled                     = var.constrain_roles == true ? local.constrain_roles : ""
  constrain_roles_and_principal_types_enabled = var.constrain_roles_and_principal_types == true ? local.constrain_roles_and_principal_types : ""
  constrain_roles_and_principals_enabled      = var.constrain_roles_and_principals == true ? local.constrain_roles_and_principals : ""

  conditionString = var.constrain_roles == true ? local.constrain_roles_enabled : var.constrain_roles_and_principal_types == true ? local.constrain_roles_and_principal_types_enabled : var.constrain_roles_and_principals == true ? local.constrain_roles_and_principals_enabled : ""

}
