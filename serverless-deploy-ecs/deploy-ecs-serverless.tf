#creating fargate cluster

resource "aws_ecs_cluster" "main" {
  name = "app-cluster"
}


#creating task definition

resource "aws_ecs_task_definition" "service" {
  family = "LightFeather-Pipeline-Project"  
  execution_role_arn       = "arn:aws:iam::204778724427:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"

  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode([
    {
      name      = "backend-app"
      image     = var.ecr-uri-backend
      cpu       = 1
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    },
    {
      name      = "frontend-app"
      image     = var.ecr-uri-frontend
      cpu       = 1
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}

#creating service and running

resource "aws_ecs_service" "main" {
  name            = "node-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"
  count = 1
  

  network_configuration {
    security_groups  = [aws_security_group.sg.id]
    subnets          = [aws_subnet.main-subnet[count.index].id]
    assign_public_ip = true
  }
}

