variable "scope" {
  description = "The scope of the resource. This can be a subscription, resource group, or resource. Most common is an subscription. Example: /subscriptions/00000000-0000-0000-0000-000000000000"
  type        = string
}

variable "description" {
  description = "The description of the role assignment. This is just used as meta data and is not required. Example: This role assignment is for..."
  type        = string
  default     = ""
}

variable "role_id_to_assign" {
  description = "The role definition ID to assign. This is the ID of the role you want the users to be able to assign to others. This could be Storage Blob Data Contributor, Virtual Machine Contributor, etc."
  type        = string
  default     = ""
}

variable "object_id_to_be_added_to_rbac_admin_role" {
  description = "The object ID of the user, group, or service principal you want to assign the role Role Based Access Control Administrator to."
  type        = string
}

variable "principal_type" {
  description = "The type of principal you want to assign the role Role Based Access Control Administrator to. This can be User, Group, or ServicePrincipal"
  type        = string
  default     = "User"
  validation {
    condition     = can(regex("User|Group|ServicePrincipal", var.principal_type))
    error_message = "The principal type must be User, Group, or ServicePrincipal"
  }
}

variable "user_type" {
  description = "Only in use when constrain_roles_and_principal_types is set to true. If you want to assign the role to a user, set this to true"
  type        = bool
  default     = false
}

variable "group_type" {
  description = "Only in use when constrain_roles_and_principal_types is set to true. If you want to assign the role to a group, set this to true"
  type        = bool
  default     = false
}

variable "service_principal_type" {
  description = "Only in use when constrain_roles_and_principal_types is set to true. If you want to assign the role to a service principal, set this to true"
  type        = bool
  default     = false
}

variable "constrain_roles" {
  description = "If you want to constrain the role assignment to only be able to assign the role, set this to true"
  type        = bool
  default     = false
}

variable "constrain_roles_and_principal_types" {
  description = "If you want to constrain the role assignment to only be able to assign the role to a specific principal type, set this to true"
  type        = bool
  default     = false
}

variable "constrain_roles_and_principals" {
  description = "If you want to constrain the role assignment to only be able to assign the role to a specific principal, set this to true"
  type        = bool
  default     = false
}

variable "object_ids_that_can_be_given_the_role" {
  description = "Only used when constrain_roles_and_principals is set to true. The object IDs of the users, groups, or service principals that will be given the chosen role. This is a list of object IDs. Example: [\"00000000-0000-0000-0000-000000000000\", \"00000000-0000-0000-0000-000000000001\"]"
  type        = list(string)
  default     = []
}

variable "enable_custom_condition" {
  description = "If you want to enable a custom condition for the role assignment, set this to true"
  type        = bool
  default     = false
}

variable "custom_condition" {
  description = "Only used when enable_custom_condition is set to true. The custom condition for the role assignment."
  type        = string
  default     = ""
}
