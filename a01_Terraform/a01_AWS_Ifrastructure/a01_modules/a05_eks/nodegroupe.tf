# backend 
resource "aws_eks_node_group" "backend_nodegroup" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${name}-nodegroup-dev"
  node_role_arn   = aws_iam_role.worker_role.arn
  capacity_type = var.capacity_type
  disk_size = var.disk_size
  instance_types = var.instance_types 
  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
    source_security_group_ids = [var.sg_ids]
  }
  subnet_ids = [var.subnet_ids_1,var.subnet_ids_2]
#   subnet_ids = [aws_subnet.dwp_pub_sub_01_id, aws_subnet.dwp_pub_sub_02_id]
  scaling_config {
    desired_size = var.desired_size_backend_nodegroup
    max_size     = var.max_size_backend_nodegroup
    min_size     = var.min_size_backend_nodegroup
  }
  labels =  tomap({env = "${name}-labels-dev"})
#   taint {
#     key    = "name"
#     value  = "app"
#     effect = "NO_SCHEDULE"
#   }
  update_config {
    max_unavailable = var.max_unavailable_backend_nodegroup 
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    # aws_subnet.dwp_pub_sub_01_id,
    # aws_subnet.dwp_pub_sub_02_id,
  ]
}

