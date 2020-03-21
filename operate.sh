#!/bin/bash
docker run -it \
     --env="DISPLAY" \
     --volume="/etc/group:/etc/group:ro" \
     --volume="/etc/passwd:/etc/passwd:ro" \
     --volume="/etc/shadow:/etc/shadow:ro" \
     --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
     --workdir="/home/$(id -u)" \
     --volume="/home/anton:/home/$(id -u)" \
     opencvtoolchainv1 /bin/bash
