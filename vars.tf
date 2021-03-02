variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}

variable "eks_cluster_subnet_ids" {
  type        = list(string)
  description = "List of subnets"
}

variable "elasticache_security_group_ids" {
  type        = list(string)
  description = "List of security group ids"
}

variable "redis_port" {
  type        = number
  default     = 6379
  description = "Port on which Redis accepts connections"
}
