#nginx webサーバー用クラスター
resource "aws_ecs_cluster" "ecs_cluster_web" {
  name = "dev-ecs-cluster-web"
}

#aゾーンのECS用サービス
resource "aws_ecs_service" "ecs_service_web_a" {
  name                              = "dev-ecs-service-web"
  cluster                           = aws_ecs_cluster.ecs_cluster_web.arn
  task_definition                   = aws_ecs_task_definition.ecs_task_definition_web.arn
  launch_type                       = "FARGATE"
  platform_version                  = "1.4.0"
  health_check_grace_period_seconds = 180
  desired_count                     = var.desired_count

  network_configuration {
    subnets         = [var.private_subnet_ids]
    security_groups = [aws_security_group.ecs_sg_web.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_tg_web.arn
    container_name   = "nginx"
    container_port   = 80
  }
}

#cゾーンのECS用サービス
resource "aws_ecs_service" "ecs_service_web_c" {
  name                              = "dev-ecs-service-web_c"
  cluster                           = aws_ecs_cluster.ecs_cluster_web.arn
  task_definition                   = aws_ecs_task_definition.ecs_task_definition_web.arn
  launch_type                       = "FARGATE"
  platform_version                  = "1.4.0"
  health_check_grace_period_seconds = 180
  desired_count                     = var.desired_count

  network_configuration {
    subnets         = [var.private_subnet_ids_2]
    security_groups = [aws_security_group.ecs_sg_web.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_tg_web.arn
    container_name   = "nginx"
    container_port   = 80
  }
}

resource "aws_ecs_task_definition" "ecs_task_definition_web" {
  family                   = "dev-ecs-task-web"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.exec_ecs_task_web.arn
  #task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([
    {
      name      = "nginx",
      image     = "public.ecr.aws/nginx/nginx:latest",
      essential = true,
      portMappings = [
        {
          containerPort = 80,
          hostPort      = 80
        }
      ]
      healthCheck : {
        command     = ["CMD-SHELL", "curl -f http://localhost/ || exit 1"]
        interval    = 30
        timeout     = 5
        retries     = 3
        startPeriod = 0
      }
    }
  ])
}
