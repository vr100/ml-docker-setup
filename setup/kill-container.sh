if [ "$#" -lt 1 ]; then
	echo "Usage: $0 image_name"
	exit 255
fi

docker kill "$1-container"
docker rm "$1-container"