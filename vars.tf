variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}

variable "eks_cluster_subnet_ids" {
  type        = list(string)
  description = "List of subnets"
}

variable "redis_cidr_srcs" {
  type        = list(string)
  description = "List of src CIDRs having access to Redis"
}

variable "redis_port" {
  type        = number
  default     = 6379
  description = "Port on which Redis accepts connections"
}

variable "redis_availability_zones" {
  type        = list(string)
  description = "List of Redis AZs"
}

variable "redis_cache_cluster_number" {
  type        = number
  description = "Number of Redis cache clusters"
}
