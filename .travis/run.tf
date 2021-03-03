#module "redis-test-deployment" {
#  source = "../"
#
#  redis_instance_name        = "test-deployment"
#  redis_cache_cluster_number = 3
#  vpc_id                     = "vpc-00ad4837d669afd8c"
#  eks_cluster_subnet_ids     = ["subnet-0f56e043b8ed33a2f","subnet-0811870f8f9ffa59e","subnet-0266c57b1cbdc8bed"]
#  redis_cidr_srcs            = ["10.157.16.0/22","10.157.20.0/22","10.157.24.0/22"]
#  redis_availability_zones   = ["eu-central-1a","eu-central-1b","eu-central-1c"]
#}

module "redis-test-deployment" {
   source = "../"

   redis_instance_name        = "test-deployment"
   redis_cache_cluster_number = 2
   vpc_id                     = "vpc-de48a7b4"
   eks_cluster_subnet_ids     = ["subnet-03ba66abda84ae93b","subnet-083b961e88a7798bc"]
   redis_cidr_srcs            = ["172.31.0.0/16","172.31.48.0/24"]
   redis_availability_zones   = ["eu-central-1a","eu-central-1b"]
}
