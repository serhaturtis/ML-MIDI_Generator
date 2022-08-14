FROM ubuntu:focal

EXPOSE 6006

RUN mkdir -p /workspace

VOLUME  /workspace

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y --no-install-recommends software-properties-common build-essential

RUN	add-apt-repository -y ppa:deadsnakes \
	&& apt-get update \
	&& apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y --no-install-recommends python3.8-venv python3.8-dev python3-pip gfortran libhdf5-dev libc-ares-dev libeigen3-dev libatlas-base-dev libopenblas-dev libblas-dev liblapack-dev libatomic1 zip unzip cmake git curl llvm-8 llvm-8-dev libsndfile-dev ffmpeg libasound2-dev libjack-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& :

RUN python3.8 -m venv /venv
ENV PATH=/venv/bin:$PATH

# Tensorflow
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install numba==0.48.0
RUN pip3 install tensorflow==2.8.1

# Tensorboard
RUN pip3 install tensorboard

# Magenta
RUN LLVM_CONFIG=llvm-config-8 pip3 install magenta
