#!/bin/bash
kubectl create namespace $NAMESPACE
kubectl create secret generic elastic-certificates --from-file=elastic-certificates.p12 --namespace $NAMESPACE 
kubectl create secret generic elastic-certificate-pem --from-file=elastic-certificate.pem --namespace $NAMESPACE 
kubectl create secret generic elastic-credentials  --from-literal=password=$ELK_PASSWORD --from-literal=username=elastic --namespace $NAMESPACE
kubectl create secret generic elastic-ca --from-file=ca.crt --namespace $NAMESPACE
kubectl create secret generic elastic-ca-pem --from-file=ca.pem --namespace $NAMESPACE
encryptionkey=$(echo $(docker run --rm docker.elastic.co/elasticsearch/elasticsearch:7.4.1 /bin/sh -c "< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c50"))
kubectl create secret generic kibana --from-literal=encryptionkey=$encryptionkey --namespace $NAMESPACE

