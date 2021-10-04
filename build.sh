#!/bin/bash
set -o errexit

CONTAINER=$(buildah from steamcmd)

buildah run $CONTAINER -- sh -c \
  'mkdir -p /home/steam/.config/unity3d/IronGate/Valheim/worlds'
buildah copy $CONTAINER $(dirname $(realpath "$0"))/startServer.sh '/home/steam'
buildah config --cmd '/home/steam/startServer.sh' $CONTAINER

buildah commit --squash $CONTAINER valheim 
