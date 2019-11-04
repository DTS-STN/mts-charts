#!/bin/bash
az login --service-principal --username $1 --password $2 --tenant $3
az storage file upload-batch --source $WORKSPACE/built-charts --destination mtsfileshare --destination-path /dts-charts --account-name $TF_VAR_STORAGE_ACCT_NAME --account-key $4

