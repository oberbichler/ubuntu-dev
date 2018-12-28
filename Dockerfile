FROM ubuntu

ENV HOME /root

ENV MINICONDA_URL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y \
    libboost-all-dev \
    bzip2 \
    libeigen3-dev \
    gcc \
    ninja-build \
    pybind11-dev

RUN curl ${MINICONDA_URL} -o ${HOME}/miniconda.sh && \
    bash ${HOME}/miniconda.sh -b -p $HOME/miniconda && \
    rm -f ${HOME}/miniconda.sh

WORKDIR ${HOME}