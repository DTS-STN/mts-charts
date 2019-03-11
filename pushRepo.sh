#!/bin/bash
export AZ_SP=$1
export AZ_SP_PASS=$2
export AZ_TENANT=$3
export AZ_SHARE_KEY=$4
export WORKSPACE=$5
echo $1
echo $2
echo $3
echo $4
echo $5

az login --service-principal --username $1 --password $2 --tenant $3
az storage file upload-batch --source $WORKSPACE/helm-charts --destination / --account-name d38dedd245ba4c1fb2026acd --account-key $4 --dryrun


