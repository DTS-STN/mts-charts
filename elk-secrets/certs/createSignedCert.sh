#!/bin/bash
if [ -z "$1" ]
then
    echo "ERROR: PLEASE PASS DOMAIN"
    echo "Usage: ./createSignedCert <domain>"
    exit

fi
mkdir $1
pushd ./$1
#Generate ROOT CA
openssl genrsa -out rootCA.key 4096
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.crt
#Generate Domain Cert
openssl genrsa -out $1.key 2048
openssl req -new -sha256 -key $1.key -subj $(echo /C=CA/OU=ESDC/O=DTS/CN=*.$1) -out $1.csr
#openssl req -new -sha256 -key $1.key -subj "/C=CA/OU=ESDC/O=DTS/CN="*."$1" -out $1.csr
openssl req -in $1.csr -noout -text
openssl x509 -req -in $1.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out $1.crt -days 500 -sha256
#Generate Elastic Cert
openssl genrsa -out elastic.key 2048
openssl req -new -sha256 -key elastic.key -subj "/C=CA/OU=ESDC/O=DTS/CN=elastic" -out elastic.csr
openssl req -in elastic.csr -noout -text
openssl x509 -req -in elastic.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out elastic.crt -days 500 -sha256
#Convert Certs To Additional Formats
openssl x509 -in rootCA.crt -out rootCA.pem
openssl x509 -in elastic.crt -out elastic.pem
openssl pkcs12 -export -out elastic.pfx -inkey elastic.key -in elastic.crt
openssl pkcs8 -in rootCA.key -topk8 -nocrypt -out rootCA.pk8
openssl pkcs8 -in elastic.key -topk8 -nocrypt -out elastic.pk8
openssl pkcs8 -in $1.key -topk8 -nocrypt -out $1.pk8
popd