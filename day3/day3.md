### Habilitar mtls para o cluster inteiro

### Sidecar do istio subir automaticamente quando um pod for criado:
kubectl label namespaces giropops istio-injection=enabled
kubectl label namespaces strigus istio-injection=enabled
kubectl label namespaces girus istio-injection=enabled

### Criar os deployments, serviceaccounts e services
  356  k apply -f httpbin.yaml -n giropops
  357  k apply -f httpbin.yaml -n strigus
  358  k apply -f httpbin.yaml -n girus
  369  k apply -f samples/sleep/sleep.yaml -n giropops
  370  k apply -f samples/sleep/sleep.yaml -n strigus
  371  k apply -f samples/sleep/sleep.yaml -n girus

### Fazer requests de testes entre os services
k exec -it -n strigus sleep-5fcd8fd6c8-rq7jq -- curl http://httpbin.giropops:8000/ip -s -o /dev/null -w "%{http_code}\n"
svc.namespace:porta
k exec -it -n strigus sleep-5fcd8fd6c8-rq7jq -- curl http://httpbin.strigus:8000/ip -s -o /dev/null -w "%{http_code}\n"
k exec -it -n strigus sleep-5fcd8fd6c8-rq7jq -- curl http://httpbin.girus:8000/ip -s -o /dev/null -w "%{http_code}\n"

### kind: "MeshPolicy" -> Aplica para todo o mesh/cluster.
apiVersion: "authentication.istio.io/v1alpha1"
kind: "MeshPolicy"
metadata:
  name: "default"
spec:
  peers:
  - mtls: {}


### Qualquer host .local (de svc) - Habilitando Mutual TLS
kind: DestinationRule
metadata:
  name: "default"
  namespace: "istio-system"
spec:
  host: "*.local"
  trafficPolicy:
    tls:
      mode: ISTIO_MUTUAL

Obs: Quando se habilita o mtls para todo o cluster tem que ter destination rule que contemple os workloads/svcs se nao vai parar de se comunicar por nao ter MTLS. E tambem para os pods que tem o sidecar do istio (envoy/proxy)

### Desabilitar o tls para um host/svc, ou seja, e um paliativo para permitir comunicacao entre hosts com TLS vs hosts sem, por que o girus nao tem o sidecar do envoy/proxy do istio.
kind: DestinantionRule
metadata:
  name: "httpbin-girus"
  namespace: "girus"
spec:
  host: "httpbin.girus.svc.cluster.local"
  trafficPolicy
    tls:
     mode: DISABLE

### Authorization
