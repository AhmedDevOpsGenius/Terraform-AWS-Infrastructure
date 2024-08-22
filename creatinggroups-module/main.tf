# Create IAM users
resource "aws_iam_user" "users" {
  for_each = toset([for membership in var.user_memberships : membership.user])

  name = each.key
}

# Create IAM groups
resource "aws_iam_group" "this" {
  count = length(var.groups)

  name = var.groups[count.index]
}

# Add users to groups
resource "aws_iam_user_group_membership" "this" {
  for_each = toset([for membership in var.user_memberships : membership.user])

  user   = each.key
  groups = lookup({ for membership in var.user_memberships : membership.user => membership.groups }, each.key, [])

  depends_on = [aws_iam_group.this]
}

# Attach custom policies to groups
# Uncomment to apply custo policy
# resource "aws_iam_group_policy_attachment" "custom" {
#   for_each = { for group_name in aws_iam_group.this : group_name.name => group_name }
#
#   group      = each.key
#   policy_arn = lookup(var.custom_policies, each.key, null)
# }

# Attach managed policies to groups
resource "aws_iam_group_policy_attachment" "managed" {
  for_each = { for group_name in aws_iam_group.this : group_name.name => group_name }

  group      = each.key
  policy_arn = lookup(var.managed_policies, each.key, null)
}
