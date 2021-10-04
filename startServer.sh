#!/bin/bash
set -o errexit

# Check for required variables
if [ ! "$SERVER_NAME" ] || [ ! "$WORLD_NAME" ] || [ ! "$SERVER_PASS" ]; then
  echo 'Requires SERVER_NAME, WORLD_NAME, and SERVER_PASS environment variables. Exiting'
  exit
fi

# Check for optional variable 
if [ -z "$SERVER_PORT" ]; then
  echo 'SERVER_PORT not defined. Using default port 2456'
  export SERVER_PORT=2456
fi

export LD_LIBRARY_PATH=$HOME/Steam/steamapps/common/Valheim\ dedicated\ server/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
export ValheimAppId=896660

# Update Steam, download/update Valheim
$HOME/steamcmd/steamcmd.sh +login anonymous +app_update $ValheimAppId validate \
  +exit

# Run Valheim
$HOME/Steam/steamapps/common/Valheim\ dedicated\ server/valheim_server.x86_64 \
  -name "$SERVER_NAME" -port "$SERVER_PORT" -world "$WORLD_NAME" \
  -password "$SERVER_PASS" -nographics -batchmode -public 1
