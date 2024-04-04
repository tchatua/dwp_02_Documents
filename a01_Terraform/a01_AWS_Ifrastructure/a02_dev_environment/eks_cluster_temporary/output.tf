output "security_group_public" {
  value = aws_security_group.worker_node_sg.id
}
# Output the Kubernetes cluster endpoint
output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}
# Output the Kubernetes cluster name
output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}



