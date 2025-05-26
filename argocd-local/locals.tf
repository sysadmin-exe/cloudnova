locals {
  resource_name_prefix    = "cloudnova"
  cluster_resource_prefix = "cloudnova-eks"
  region                  = "eu-west-1"
  eks_nodes_instance_types = ["t2.micro",]
  eks_nodes_ami_type      = "AL2023_ARM_64_STANDARD"

  argocd_namespace = "argocd"
  argocd_server_helm_chart = {
    name       = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-cd"
    version    = "7.9.1"
  }
  argocd_rollouts_helm_chart = {
    name       = "argo-rollouts"
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-rollouts"
    version    = "2.39.5"
  }
  nginx_ingress_helm_chart = {
    name       = "ingress-nginx"
    repository = "https://kubernetes.github.io/ingress-nginx"
    chart      = "ingress-nginx"
    version    = "4.12.2"
    namespace  = "nginx-ingress"
  }
  kube_prometheus_stack_helm_chart = {
    name       = "kube-prometheus-stack"
    repository = "https://prometheus-community.github.io/helm-charts"
    chart      = "kube-prometheus-stack"
    version    = "72.3.0"
    namespace  = "monitoring"
  }
}