#!/bin/bash

if [ -z "$1" ]; then
    echo "docker-machine-import <machine-archive-path> [machine-cert-path]"
    exit 1
fi

ARCHIVE_PATH=$1
FILE_NAME=$(basename "$ARCHIVE_PATH")
MACHINE_NAME="${FILE_NAME%%.*}"
MACHINES_PATH="$HOME/.docker/machine/machines"
MACHINE_PATH="$MACHINES_PATH/$MACHINE_NAME"

if [ -d "$MACHINE_PATH" ]; then
    echo "$MACHINE_PATH exists"
    exit 1
fi

echo "Extracting config"

mkdir -p $MACHINE_PATH
tar -xzf $ARCHIVE_PATH -C $MACHINE_PATH
sed -i "s:USER_HOME:$HOME:g" $MACHINE_PATH/config.json

echo "Config extracted to $MACHINE_PATH"


if [ -z "$2" ]; then
    exit 0
fi

ARCHIVED_CERT_PATH=$2
CERT_PATH="$HOME/.docker/machine/certs"
if [ -d "$CERT_PATH" ]; then
    echo "$CERT_PATH exists"
    exit 1
fi

echo "Extracting certs"
mkdir -p $CERT_PATH
tar -xzf $ARCHIVED_CERT_PATH -C $CERT_PATH
echo "Certs extracted to $CERT_PATH"
