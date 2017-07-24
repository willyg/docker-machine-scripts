# docker-machine-share

Use these scripts to share docker machine config with different user or different docker machine.

Download the scripts:

```
wget https://raw.githubusercontent.com/willyg/docker-machine-share/master/docker-machine-import.sh
wget https://raw.githubusercontent.com/willyg/docker-machine-share/master/docker-machine-export.sh
```


1. Export docker machine config:

`bash docker-machine-export.sh <machine-name> [-i|--include-ca-cert]`

2. Copy machine.tar.gz and certs.tar.gz (if included) to target machine
3. Import docker machine config (and ca certs):

`bash docker-machine-import.sh <machine-archive-path> [machine-cert-path]`

