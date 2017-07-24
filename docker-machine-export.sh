#!/bin/bash

if [ -z "$1" ] || ([ -n "$2" ] && ! ([ "$2" == "-i" ] || [ "$2" == "--include-ca-cert" ])); then
    echo "docker-machine-export <machine-name> [-i|--include-ca-cert]"
    exit 1
fi

MACHINE_NAME=$1

echo "Starting machine config export"
RANDOM_STRING=$(head /dev/urandom | tr -dc a-z | head -c 5)
TMP_DIR=/tmp/${MACHINE_NAME}_$RANDOM_STRING

mkdir $TMP_DIR
cp -r $HOME/.docker/machine/machines/$MACHINE_NAME $TMP_DIR/$MACHINE_NAME

sed -i "s:$HOME:USER_HOME:g" $TMP_DIR/$MACHINE_NAME/config.json
tar -czf $MACHINE_NAME.tar.gz -C $TMP_DIR/$MACHINE_NAME .

echo "Config exported to $MACHINE_NAME.tar.gz"


if [ -z "$2" ]; then
    rm -rf $TMP_DIR
    exit 0
fi

echo "Starting CA cert export"
cp -r $HOME/.docker/machine/certs $TMP_DIR/certs
tar -czf certs.tar.gz -C $TMP_DIR/certs .
echo "CA certs exported to certs.tar.gz"

rm -rf $TMP_DIR
