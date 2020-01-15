#!/bin/bash
#Generate ROOT CA
openssl genrsa -out rootCA.key 4096
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.crt
#Generate Domain Cert
openssl genrsa -out dts-stn.com.key 2048
openssl req -new -sha256 -key dts-stn.com.key -subj "/C=CA/OU=ESDC/O=DTS/CN=dts-stn.com" -out dts-stn.com.csr
openssl req -in dts-stn.com.csr -noout -text
openssl x509 -req -in dts-stn.com.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out dts-stn.com.crt -days 500 -sha256
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