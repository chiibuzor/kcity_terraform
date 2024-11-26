resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
}

resource "aws_ecs_service" "api_service" {
  cluster = aws_ecs_cluster.main.id
  name    = var.service_names[0]

  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.desired_count
}
