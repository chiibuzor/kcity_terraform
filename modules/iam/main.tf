resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
  ...
}

resource "aws_iam_policy" "s3_access" {
  policy = jsonencode({
    Statement = [
      {
        Action   = ["s3:*"],
        Effect   = "Allow",
        Resource = ["*"]
      }
    ]
  })
}
