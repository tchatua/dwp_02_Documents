resource "aws_eks_cluster" "eks" {
  name     = "dwp-eks-01"
  role_arn = aws_iam_role.master.arn

  vpc_config {
    subnet_ids = ["subnet-0046e4fbd55e62d27", "subnet-045929e8e00381296"]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    #aws_subnet.pub_sub1,
    #aws_subnet.pub_sub2,
  ]

}
