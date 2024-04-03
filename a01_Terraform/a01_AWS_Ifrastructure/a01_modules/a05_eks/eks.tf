resource "aws_eks_cluster" "eks_cluster" {
  name = "${var.name}-eks-01"  
  role_arn = aws_iam_role.controller_role.arn

  vpc_config {
    subnet_ids = [var.subnet_ids_1,var.subnet_ids_2]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure 
  #such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    # aws_subnet.dwp_pub_sub_01_id,
    # aws_subnet.dwp_pub_sub_02_id,
  ]
}
