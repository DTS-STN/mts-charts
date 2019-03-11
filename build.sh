#!/bin/bash
export workspace=$1
mkdir $workspace/helm-charts
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
