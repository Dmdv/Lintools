#!/usr/bin/env bash
GOARCH="go1.9.2.linux-amd64.tar.gz"
GOLINK="https://storage.googleapis.com/golang/"${GOARCH}
wget ${GOLINK}
ls
sleep 5s
echo "=== Deleting ==="
rm -rf ${GOARCH}
ls
