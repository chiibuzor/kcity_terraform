resource "aws_rds_global_cluster" "global" {
  global_cluster_identifier = "knowledgecity-global"
}

resource "aws_rds_cluster" "primary" {
  global_cluster_identifier = aws_rds_global_cluster.global.id
  engine = "aurora-mysql"
  ...
}
