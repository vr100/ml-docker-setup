#!/bin/bash
cd $(dirname "$0")/../dockers
echo `pwd`

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 image_name"
elif [ $1 == "base-ml" ]; then
	docker build --tag base-ml -f jupyterlab-docker .
elif [ $1 == "nodejs" ]; then
	docker build --tag nodejs -f nodejs-docker .
elif [ $1 == "qiskit" ]; then
	docker build --tag qiskit -f qiskit-docker .
elif [ $1 == "ml-learn" ]; then
	docker build --tag ml-learn -f octave-docker .
else
	echo "Image name: $1 not supported"
fi

