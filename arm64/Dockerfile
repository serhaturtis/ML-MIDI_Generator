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

# Tensorflow 2.5.0
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install numpy==1.19.5
RUN pip3 install pybind11
RUN pip3 install Cython
RUN pip3 install h5py==3.1.0
RUN pip3 install --upgrade wrapt
RUN pip3 install gast==0.4.0
RUN pip3 install absl-py astunparse
RUN pip3 install flatbuffers google_pasta
RUN pip3 install keras_preprocessing --no-deps
RUN pip3 install opt_einsum protobuf
RUN pip3 install six termcolor
RUN pip3 install typing_extensions
RUN pip3 install gdown

# To download if doesn't exists
# RUN gdown https://drive.google.com/uc?id=1I1H2xMs4BTm-UQhBPuLgqnLgmE0ATRl5
COPY ./files/tensorflow-2.5.0-cp38-cp38-linux_aarch64.whl /
RUN pip3 install tensorflow-2.5.0-cp38-cp38-linux_aarch64.whl
RUN rm tensorflow-2.5.0-cp38-cp38-linux_aarch64.whl

# Tensorflow 2.5.0 Cpp API
# RUN gdown https://drive.google.com/uc?id=1uZ-WZakMQkN1ESf3mXuwcr7mbE0QZhIHK
# RUN tar -C /usr/local -xzf libtensorflow_cp38_64OS_2_5_0.tar.gz

# Tensorboard
RUN pip3 install tensorboard

# Magenta
RUN LLVM_CONFIG=llvm-config-8 pip3 install magenta

ENV LD_PRELOAD=/venv/lib/python3.8/site-packages/scikit_learn.libs/libgomp-d22c30c5.so.1.0.0
