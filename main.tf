resource "helm_release" "ingress-nginx-controller-interno" {
  name       = "ingress-nginx-controller-interno"
  namespace  = "ingress"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = "0.16.2"
  create_namespace = true
  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
  set{
    name="controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal"
    value="true"
  }
    set {
    name = "controller.ingressClass"
    value = "nginx"
  }
  set {
    name = "controller.setAsDefaultIngress"
    value = true
  }
  set {
    name = "controller.ingressClassResource.name"
    value = "class1"
  }
  set {
    name = "controller.ingressClassResource.enabled"
    value = "true"
  }
  set {
    name = "controller.ingressClassByName"
    value = "true"
  }
  set {
    name = "controller.electionID"
    value = "nginx-interno"
  }
  set {
    name = "controller.ingressClassResource.controllerValue"
    value = "k8s.io/ingress-nginx-interno"
  }
  depends_on = [
    kubernetes_namespace.ingress,
  ]
}