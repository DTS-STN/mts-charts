#!/bin/bash
export AZ_SP=$1
export AZ_SP_PASS=$2
export AZ_TENANT=$3
export AZ_SHARE_KEY=$4
export WORKSPACE=$5
echo $AZ_SP
echo $AZ_SP_PASS
echo $AZ_TENANT
echo $AZ_SHARE_KEY
echo $WORKSPACE

az login --service-principal --username $AZ_SP --password $AZ_SP_PASS --tenant $AZ_TENANT
az storage file upload-batch --source $WORKSPACE/helm-charts --destination / --account-name d38dedd245ba4c1fb2026acd --account-key $AZ_SHARE_KEY --dryrun


