variable "redis_instance_name" {
  type        = string
  description = "Redis instance name"
}

variable "redis_node_type" {
  type        = string
  description = "Redis node type"
  default     = "cache.r6g.large"
}

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

variable "redis_rest_encryption" {
  type        = bool
  descripton  = "Redis rest encryption on/off"
}

variable "redis_transit_encryption" {
  type        = bool
  description = "Redis transit encryption on/off"
}
