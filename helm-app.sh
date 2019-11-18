#!/bin/sh
set -e

# nfs-client-provisioner
helm delete --purge nfs-client-provisioner
helm install --name=nfs-client-provisioner --namespace=kube-system \
    --set image.repository=quay-mirror.qiniu.com/external_storage/nfs-client-provisioner \
    --set nfs.server=xxxxxx.cn-hangzhou.nas.aliyuncs.com \
    --set nfs.path=/k8s \
    --set nfs.mountOptions={"vers=4\,minorversion=0\,noresvport"} \
    --set storageClass.defaultClass=true \
    stable/nfs-client-provisioner
