DEST_DIR="/home/admin/files/run"

find "${DEST_DIR}" -mtime +7 -type -name "*.mp3" -delete
