#!/bin/bash
if [ "$#" -lt 2 ]; then
	echo "Usage: $0 create|attach|restart image_name <volume_dir>"
	echo "<volume_dir> is required only for create action"
	exit 255
fi

if [ $1 == "attach" ]; then
	docker exec -it "$2-container" /bin/bash
	exit 0
elif [ $1 == "restart" ]; then
	docker start -a -i "$2-container"
	exit 0
elif [ $1 == "create" ]; then
	if [ "$#" -lt 3 ]; then
		echo "Volume dir is required for creating a container"
		echo "Usage: $0 create|attach|restart image_name volume_dir"
		exit 255
	fi
else
	echo "Action $1 not supported"
	exit 255
fi

ports="-p 127.0.0.1:8080:8080"
if [ $2 == "nodejs" ]; then
	ports="$ports -p 127.0.0.1:3030:3030"
fi

if [ $2 == "base-ml" -o $2 == "nodejs" -o $2 == "qiskit" -o $2 == "ml-learn" -o $2 == "cv"  -o $2 == "waymo"]; then
	docker run --name "$2-container" -v "$3":/workspace $ports -it --privileged $2 /bin/bash
else
	echo "Image name: $2 not supported"
fi
