output "cluster_name"{
    value = aws_ecs_cluster.iac-ecs-cluster.name
}

output "cluster_service_name"{
    value = aws_ecs_service.iac-cluster-service.name
}