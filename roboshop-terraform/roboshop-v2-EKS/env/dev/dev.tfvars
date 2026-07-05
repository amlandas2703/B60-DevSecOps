subnet_ids = [
      "subnet-09b2695bd71493b07",
      "subnet-0c203b4835f801325",
      "subnet-0289482dd0866e2a3"
]

cluster_name = "roboshop"
env = "test"
eks_version = "1.35"
node_group_desired_size = 2
node_group_max_size = 5
node_group_min_size = 1
instance_types = [
  "t3.medium",
  "t3.large"
]