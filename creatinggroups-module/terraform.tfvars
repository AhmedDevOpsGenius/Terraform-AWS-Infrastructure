groups = ["Group1", "Group2"]

# uncomment and add custom policies
#custom_policies = {
#  Group1 = "arn:aws:iam::aws:policy/CustomPolicy1"
#  Group2 = "arn:aws:iam::aws:policy/CustomPolicy2"
#}

managed_policies = {
  Group1 = "arn:aws:iam::aws:policy/AdministratorAccess"
  Group2 = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

user_memberships = [
  {
    user   = "user1"
    groups = ["Group1"]
  },
  {
    user   = "user2"
    groups = ["Group2"]
  }
]
