FROM ubuntu:bionic

ENV HOME /root

ENV MINICONDA_URL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN apt-get update -y

RUN apt-get install -y curl bzip2 && \
    curl $MINICONDA_URL -o $HOME/miniconda.sh && \
    sh $HOME/miniconda.sh -b -p $HOME/miniconda && \
    rm -f $HOME/miniconda.sh

RUN apt-get install -y \
    libboost-all-dev \
    coinor-libipopt-dev \
    libeigen3-dev \
    build-essential \
    ninja-build \
    cmake \
    vim

RUN $HOME/miniconda/bin/conda install -y \
    ipython \
    pytest \
    mkl-devel \
    numpy \
    scipy \
    tbb-devel

ENV PATH $HOME/miniconda/bin/:$PATH

RUN /bin/bash -c "source activate"

CMD [ "/bin/bash" ]

WORKDIR $HOME
