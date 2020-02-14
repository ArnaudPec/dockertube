#!/bin/sh

# Refresh nextcloud database

cd /data
occ files:scan -p admin/files/run/
