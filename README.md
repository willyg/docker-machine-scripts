# docker-machine-export docker-machine-import

Use these scripts to share docker machine config with different user or different docker machine.

Download the scripts:

```
wget https://raw.githubusercontent.com/willyg/docker-machine-scripts/master/docker-machine-import.sh
wget https://raw.githubusercontent.com/willyg/docker-machine-scripts/master/docker-machine-export.sh
```


1. Export docker machine config:

`bash docker-machine-export.sh <machine-name> [-i|--include-ca-cert]`

2. Copy machine.tar.gz and certs.tar.gz (if included) to target machine
3. Import docker machine config (and ca certs):

`bash docker-machine-import.sh <machine-archive-path> [machine-cert-path]`


# docker-machine-activate
Update PS1 prompt to show which docker-machine is currently active

Download the script:

```
wget https://raw.githubusercontent.com/willyg/docker-machine-scripts/master/docker-machine-activate
```

Run `source docker-machine-activate <machine-name>` to activate a docker machine

Run `deactivate` to deactivate
