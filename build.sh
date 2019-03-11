#!/bin/bash
export workspace=$1
mkdir -p $workspace/helm-charts

#Check if helm installed
if ! helm init --client-only;
then
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.0-linux-amd64.tar.gz
    tar -zxvf helm-v2.13.0-linux-amd64.tar.gz
    mv linux-amd64/helm /usr/local/bin/helm
    if ! helm init --client-only;
    then
        echo "Unable to initalize Helm"
        exit 1
    fi
fi

find . -type f -iname "Chart.yaml" -print0 | while IFS= read -r -d $'\0' line; do
    export realPath=`realpath $line`
    export directory=`dirname $realPath`
    pushd $directory
        if  helm lint . ;
        then
            if ! helm package -d $workspace/helm-charts . ;
            then
                echo "Building Failed"
                exit 1;
            fi
        else
            echo "Linting Failed"
            exit 1;
        fi
    popd
done
helm repo index $workspace/helm-charts
