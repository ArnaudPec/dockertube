#!/bin/bash
set -e

PROJ_DIR="/home/admin/test_dockertube"
DEST_DIR="/home/admin/files/run"
CONV_DIR="${PROJ_DIR}/out"

mkdir -p ${CONV_DIR}
cd ${PROJ_DIR}

if [[ "$1" = "-b" ]];
then
    docker build -t dockertube .
fi

# Run the fetch and convert container
docker run -v "${CONV_DIR}:/mnt" -l "debug" dockertube:latest

# Copy output audio
find "${CONV_DIR}" -mindepth 1 -exec cp {} "${DEST_DIR}/" \;

# Remove output audio
find "${CONV_DIR}" -mindepth 1 -name "*.mp3" -exec rm -f {} \;

# Refresh nextcloud db
docker exec -it admin_nextcloud_1 occsr.sh
