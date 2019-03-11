#!/bin/bash
az login --service-principal --username $1 --password $2 --tenant $3
az storage file upload-batch --source $WORKSPACE/helm-charts --destination / --account-name d38dedd245ba4c1fb2026acd --account-key $4

