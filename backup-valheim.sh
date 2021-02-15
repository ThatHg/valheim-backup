#!/bin/bash

save_directory=$1
world_directory=$2
now=$(date +'%Y%m%d%H%M%S')
backup_filename="valheim_worlds_${now}.tar.gz"

if [ -z "$save_directory" ]
then
    save_directory=$(pwd)
    echo "Save directory not set, using current pwd ($save_folder)."
fi

if [ -z "$world_directory" ]
then
    world_directory="~/.config/unity3d/IronGate/Valheim/worlds"
    echo "World directory not set, using default ($world_directory)."
fi

if [ ! -d "$save_directory" ] 
then
    echo "Save directory $save_directory DOES NOT exists."
    echo "Usage: $0 [save_directory] [world_directory]"
    exit 1
fi

if [ ! -d "$world_directory" ] 
then
    echo "World directory $world_directory DOES NOT exists."
    echo "Usage: $0 [save_directory] [world_directory]"
    exit 1
fi

cd "$save_directory"
tar -czf "$backup_filename" "$world_directory" > /dev/null 2>&1
if [ $? -eq 0 ]; then
   echo "Backup SUCCESS, created at: ${save_directory}/${backup_filename}"
else
   echo "Backup FAILED"
fi