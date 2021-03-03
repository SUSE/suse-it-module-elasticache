resource "aws_elasticache_subnet_group" "subnet-redis-wwwsusecom-prod" {
  name        = "subnet-redis-wwwsusecom-prod"
  subnet_ids  = var.eks_cluster_subnet_ids
  description = "Elasticache subnet group"
}

resource "aws_security_group" "redis-wwwsusecom-prod" {
  name        = "redis-wwwsusecom-prod"
  description = "Allow traffic from/to redis"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.redis_port
    to_port     = var.redis_port
    protocol    = "tcp"
    cidr_blocks = var.redis_cidr_srcs
    description = "Allowed Traffic to Redis"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All Outbound allowed on all ports"
  }
}

resource "aws_elasticache_replication_group" "redis-wwwsusecom-prod" {
  replication_group_id          = "redis-wwwsusecom-rep-group-1"
  replication_group_description = "Redis replication group"
  engine                        = "redis"
  multi_az_enabled              = true
  automatic_failover_enabled    = true
  at_rest_encryption_enabled    = true
  subnet_group_name             = aws_elasticache_subnet_group.subnet-redis-wwwsusecom-prod.name
  security_group_ids            = [aws_security_group.redis-wwwsusecom-prod.id]
  availability_zones            = var.redis_availability_zones
  node_type                     = "cache.r6g.large"
  number_cache_clusters         = var.redis_cache_cluster_number
  parameter_group_name          = "default.redis6.x"
  port                          = var.redis_port
}
