#!/bin/bash

set -eux

image="ghcr.io/ninanor/bachelor-oppgave-nina:nina"
data="/data"

zenity --progress --pulsate --title="FiskAI launcher" --text="Downloading latest version..." &
progressbar_pid="$!"
docker pull "$image"
kill "$progressbar_pid"

docker run --rm --pid=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    --gpus all \
    -v "$data":"$data" \
    "$image"
