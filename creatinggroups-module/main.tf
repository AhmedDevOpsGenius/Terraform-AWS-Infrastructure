# Create IAM users if users not there
resource "aws_iam_user" "users" {
  for_each = toset([for membership in var.user_memberships : membership.user])

  name = each.key
}

# Create IAM groups
resource "aws_iam_group" "this" {
  count = length(var.groups)

  name = var.groups[count.index]
}

# add users to groups 
resource "aws_iam_user_group_membership" "this" {
  for_each = aws_iam_user.users

  user   = each.key
  groups = lookup({ for membership in var.user_memberships : membership.user => membership.groups }, each.key, [])

  depends_on = [aws_iam_group.this]
}
