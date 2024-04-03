output "eks_endpoint" {
  #   value = aws_eks_cluster.eks_cluster.endpoint
  value = module.eks.endpoint
}

# resource "aws_security_group" "worker_node_sg"
output "eks_security_group_public_eks_id" {
  value = module.eks.security_group_public_eks_id
}