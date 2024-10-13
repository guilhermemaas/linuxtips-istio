### Istiod - Istio Super Daemon
Pilot
Citadel
Gallery

### Service Mesh
Controlar a entrada (Ingress) e (Egress)
Ou seja, o trafego de saida e entrada, no caso da saida, por exemplo, permitir acessar um banco de dados externo ao cluster, ou uma Lambda na AWS.

### Install Istio
https://istio.io/latest/docs/setup/additional-setup/download-istio-release/

curl -L https://istio.io/downloadIstio | sh -

### Demo Book Store
https://istio.io/latest/docs/setup/getting-started/

### Add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy your application later:

$ kubectl label namespace default istio-injection=enabled
namespace/default labeledS

### Istioctl analyze

istioctl analyze