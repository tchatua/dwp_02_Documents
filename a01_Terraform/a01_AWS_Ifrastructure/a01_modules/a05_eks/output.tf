output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

# resource "aws_security_group" "worker_node_sg"
output "security_group_public_eks_id" {
  value = "${aws_security_group.worker_node_sg.id}"
}