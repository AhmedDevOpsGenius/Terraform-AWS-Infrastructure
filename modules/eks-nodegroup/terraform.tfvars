region                    = "us-west-2"
cluster_name              = "testcluster"
cluster_version           = "1.27"
subnets                   = ["subnet-13ec6c59", "subnet-75accb0d", "subnet-9f44aab5"]  # Update with your subnet IDs
vpc_id                    = "vpc-01234"
worker_instance_type      = "t3.medium"
worker_desired_capacity   = 2
worker_max_capacity       = 5
worker_min_capacity       = 2
