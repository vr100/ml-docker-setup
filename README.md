# ml-docker-setup
Docker setup for ML projects

## Build Docker images

**Supported images**

* **base-ml**: ml docker image with jupyterlab
* **nodejs**: nodejs docker image with python and pandas support
* **qiskit**: qiskit docker image for trying out quantum computing examples
* **ml-learn**: ml docker image with octave

**Commands**

**Building image**

	./setup/build-image.sh <image-name>

For example,

	./setup/build-image.sh nodejs

**Kill container**

	./setup/kill-container.sh <image-name>

**Start container**

	./setup/start-container.sh <action> <image-name> <volume-dir>

The supported actions are given below:

***create a container***

	./setup/start-container.sh create nodejs /home/user/data/

where /home/user/data/ is mounted as a volume in the created container

***restart a closed container***

	./setup/start-container.sh restart nodejs

***attach to running container***

	./setup/start-container.sh attach nodejs
