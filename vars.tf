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
