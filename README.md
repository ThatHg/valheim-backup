A script that creates a compressed archive with name "valheim_worlds_<curren datetime>.tar.gz"

> backup-valheim.sh [save_directory] [world_directory]

# Installation

## Prepare start_server.sh
Go to
`/home/username/.steam/steam/steamapps/common/"Valheim dedicated server"/`

make a copy of start_server:
`cp start_server.sh start_valheim_server.sh`

Open `start_valheim_server.sh` in your favorite editor and add this to the end of the file
```
while true; do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    echo "valheim.service: Creating backup ${TIMESTAMP}"
    path/to/backup-valheim.sh
    sleep 3600 # Create backup every hour
done
```

## valheim.service

Replace `username` in `valheim.service` to your own username.

Then copy the service to systemd
`sudo cp valheim.service /etc/systemd/system`

Reload the daemon
`sudo systemctl daemon-reload`

Start valheim service
`sudo systemctl start valheim`

And lastly add enable it for autostart on boot
`sudo systemctl enable valheim.service`
