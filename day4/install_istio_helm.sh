# kubectl delete -f install/kubernetes/istio-demo-auth.yaml
# kubectl delete -f install/kubernetes/istio-demo.yaml
# for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl delete -f $i; done
# kubectl get virtualservices.networking.istio.io --all-namespaces
 

  # for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done
  # wget https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz
  # tar -xvzf helm-v2.14.3-linux-amd64.tar.gz
  # cd linux-amd64/
  # mv helm /usr/local/bin/
  # mv tiller /usr/local/bin/
  # helm init
  # kubectl get deployments. --all-namespaces
  # helm list
  # kubectl create serviceaccount --namespace=kube-system tiller
  # kubectl create clusterrolebinding tiller-cluster-role --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
  # kubectl patch deployments -n kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'  # kubectl get deployments. --all-namespaces
  # kubectl get pods --all-namespaces
  # helm list
  # helm --help
  # helm search prometheus
  # helm template install/kubernetes/helm/istio --name istio --namespace istio-system --values install/kubernetes/helm/istio/values.yaml --set gateways.istio-ingresssgateway.type=NodePort --set grafana.enabled=true --set kiali.enabled=true --set tracing.enabled=true --set kiali.dashboard.username=admin --set kiali.dashboard.passphrase=admin --set servicegraph.enabled=true > meu_istio.yaml
  # vim meu_istio.yaml
  # kubectl create namespace istio-system
  # kubectl apply -f meu_istio.yaml
  # kubectl get pods -n istio-system
  # kubectl get pods -n istio-system --watch
  
 

 # KIALI_USERNAME=$(read -p 'Kiali Username: ' uval && echo -n $uval | base64)
 # KIALI_PASSPHRASE=$(read -sp 'Kiali Passphrase: ' pval && echo -n $pval | base64)
 # echo $KIALI_USERNAME
 # echo $KIALI_PASSPHRASE
 # NAMESPACE=istio-system
 # cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: kiali
  namespace: $NAMESPACE
  labels:
    app: kiali
type: Opaque
data:
  username: $KIALI_USERNAME
  passphrase: $KIALI_PASSPHRASE
EOF

 # kubectl get services -n istio-system
 # kubectl port-forward svc/kiali 20001:20001 -n istio-system --address=0.0.0.0 &
 

