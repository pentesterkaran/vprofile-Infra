output "cluster_name" {
  description = "this is the name of cluster"
  value       = module.eks.cluster_name
}
output "clusterEndpoint" {
  description = "this is the url of control plane API server"
  value       = module.eks.cluster_endpoint
}
output "region" {
  value = var.region
}
output "eksSecurityGroup" {
  value = module.eks.cluster_security_group_id
}