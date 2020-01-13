#!/bin/bash
openssl genrsa -out rootCA.key 4096
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.crt
openssl genrsa -out dts-stn.com.key 2048
openssl req -new -sha256 -key dts-stn.com.key -subj "/C=CA/OU=ESDC/O=DTS/CN=dts-stn.com" -out dts-stn.com.csr
openssl req -in dts-stn.com.csr -noout -text
openssl x509 -req -in dts-stn.com.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out dts-stn.com.crt -days 500 -sha256