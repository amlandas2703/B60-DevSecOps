subnet_ids = [
      "subnet-0e8b46e75224cb3c9",
      "subnet-019da47817fb4488b",
      "subnet-0c23caf2e6636d36f"
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