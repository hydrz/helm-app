#!/bin/sh
set -e

# nfs-client-provisioner
helm upgrade stable/nfs-client-provisioner \
    --name=nfs --namespace=kube-system \
    --set image.repository=quay-mirror.qiniu.com/external_storage/nfs-client-provisioner \
    --set nfs.server=x.x.x.x \
    --set nfs.path=/exported/path
