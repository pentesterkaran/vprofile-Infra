module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
  name    = "vpcForEKS"
  cidr    = "172.10.0.0/16"

  azs             = slice(data.aws_availability_zones.availableZone.names, 0, 3)
  private_subnets = ["172.10.1.0/24", "172.10.2.0/24", "172.10.3.0/24"]
  public_subnets  = ["172.10.4.0/24", "172.10.5.0/24", "172.10.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }

}


