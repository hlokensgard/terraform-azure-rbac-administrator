module "rbac_admin" {
  source                        = "..."
  version                       = "..."
  scope                         = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_id_to_assign             = "acdd72a7-3385-48ef-bd42-f606fba81ae7" # Reader
  principal_type                = "User"
  object_id_of_user_to_be_added = "00000000-0000-0000-0000-000000000000" # User GUID

  constrain_roles_and_principal_types = true
  user_type                           = true
  group_type                          = true
}
