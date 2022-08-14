#!/bin/bash

if [ -z "$1" ] && [ -z "$2" ]
then
	echo "Port and workspace argument needed."
else
	HOST_WORKSPACE="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
	echo "Workspace path: ${HOST_WORKSPACE}"

	docker context use rootless
	docker create --publish $2:6006 \
	--volume $HOST_WORKSPACE:/workspace \
	--entrypoint /workspace/train_evaluate.sh \
	--name magentasess magenta

	docker start magentasess
fi
