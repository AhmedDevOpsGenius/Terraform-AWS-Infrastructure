variable "groups" {
  description = "List of IAM group names to be created."
  type        = list(string)
}

variable "custom_policies" {
  description = "Map of custom policy ARNs to attach to each group."
  type = map(string)
  default = {}
}

variable "managed_policies" {
  description = "Map of managed policy ARNs to attach to each group."
  type = map(string)
  default = {}
}

variable "user_memberships" {
  description = "List of user memberships, including user names and the groups they should belong to."
  type = list(object({
    user   = string
    groups = list(string)
  }))
}
