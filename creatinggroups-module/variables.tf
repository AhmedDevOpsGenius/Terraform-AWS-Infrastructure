variable "groups" {
  description = "List of IAM group names to be created."
  type        = list(string)
}

variable "custom_policies" {
  description = "List of custom policy ARNs to attach to each group."
  type        = list(string)
  default     = []
}

variable "managed_policies" {
  description = "List of managed policy ARNs to attach to each group."
  type        = list(string)
  default     = []
}

variable "user_memberships" {
  description = "List of user memberships, including user names and the groups they should belong to."
  type = list(object({
    user   = string
    groups = list(string)
  }))
}
