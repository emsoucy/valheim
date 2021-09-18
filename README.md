# Valheim Dedicated Server Container
### Building:
```
buildah unshare bash build.sh
```

### Running:
```bash
podman run \
  -d \
  --name valheim \
  -e SERVER_NAME=<your server name> \
  -e WORLD_NAME=<your world name> \
  -e SERVER_PASS=<your secret password> \
  -e PORT=2456 \                         
  -p 2456-2457:2456-2457/udp \                         
  -v <your data directory>:/home/steam/.config/unity3d/IronGate/Valheim:Z,U \
  valheim                                                                    
```
Requires ```SERVER_NAME```, ```WORLD_NAME```, and ```SERVER_PASS```.

```PORT``` is optional and will default to ```2456``` if omitted.

Be sure to provide a volume that the game can use to store the ```worlds``` directory, ```adminlist.txt```, ```bannedlist.txt```, and ```permittedlist.txt```

The directory structure that Valheim will use this area for is as follows:

```
directory/
├── adminlist.txt
├── bannedlist.txt
├── binds.txt
├── permittedlist.txt
├── prefs
└── worlds
    └── your_world_name.fwl
```

### Note:
When the container is started it will download and verify the game. This can take a moment if it is the first time that the container is being run.