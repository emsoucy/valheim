#!/usr/bin/env bash
set -o errexit

# Vars
CONTAINER=$(buildah from docker.io/emsoucy/steamcmd)
MOUNTPOINT=$(buildah mount $CONTAINER)

buildah run $CONTAINER -- sh -c 'mkdir -p /home/steam/.config/unity3d/IronGate/Valheim/worlds'
buildah copy $CONTAINER 'startServer.sh' '/home/steam'

buildah config --cmd '/home/steam/startServer.sh' $CONTAINER

buildah unmount $CONTAINER
buildah commit --squash $CONTAINER valheim 