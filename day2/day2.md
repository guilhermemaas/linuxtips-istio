### host do virtualservice é o endereço/nome do serviço/dns. Por que o Istio também pode ser instalado em uma VM além do Kubernetes.

    route:
    - destination:
        host: productpage
        port:
          number: 9080


### o match para encaminhar o tráfego não precisa ser apenas URI, pode ser os headers do pacote http, por exemplo.

gateways:
  - bookinfo-gateway
  http:
  - match:
    - uri:
        exact: /productpage
    - uri:
        prefix: /static

#### Quando eu crio um virtualenv, também tenho que criar o destination rule, se não, ocorre o erro abaixo:
Error [IST0101] (VirtualService default/details) Referenced host+subset in destinationrule not found: "details+v1"
Error [IST0101] (VirtualService default/productpage) Referenced host+subset in destinationrule not found: "productpage+v1"
Error [IST0101] (VirtualService default/ratings) Referenced host+subset in destinationrule not found: "ratings+v1"
Error [IST0101] (VirtualService default/reviews) Referenced host+subset in destinationrule not found: "reviews+v1"


### Cada deployment/svc tem um Virtual Service e um Destination Roule

### Alterar a rota com base em um parametro do heard da request:
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: reviews
spec:
  hosts:
  - reviews
  http:
  - match:
    - headers:
        end-user:
          exact: giropops  
    route:
    - destination:
        host: reviews
        subset: v1
      weight: 33  
    - destination:
        host: reviews
        subset: v2
      weight: 33
    - destination:
        host: reviews
        subset: v3
      weight: 33

### Injetar uma falha proposital (Adicionar delay nas nos responses de um virtual service > service) - Falt injection


