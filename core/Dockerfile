FROM ubuntu:20.04

# PROXY SETTINGS
ARG all_proxy
ARG ftp_proxy
ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG socks_proxy

ENV all_proxy $all_proxy
ENV ftp_proxy $ftp_proxy
ENV http_proxy $http_proxy
ENV https_proxy $https_proxy
ENV no_proxy $no_proxy
ENV socks_proxy $socks_proxy

ENV PATH /opt/conda/bin/:$PATH

# Fix for tzdata: https://rtfm.co.ua/en/docker-configure-tzdata-and-timezone-during-build/
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git curl grep sed dpkg vim \
        g++ \
        libgdal-dev \
        libsndfile1-dev \
        cmake

ENV CPLUS_INCLUDE_PATH /usr/include/gdal
ENV C_INCLUDE_PATH /usr/include/gdal

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
    # /opt/conda/etc/profile.d/conda.sh && \
RUN conda create -n dl python=3.6.9 --no-default-packages && \
    echo "conda activate dl" >> ~/.bashrc
RUN conda install -n dl tensorflow=2.2.0 scipy=1.4.1 pandas=1.0.5 pandas-datareader=0.9.0 pandas-profiling=1.4.1  && \
    conda install -n dl pytorch=1.6.0 torchvision=0.7.0 torchtext=0.7.0 cpuonly -c pytorch

COPY requirements.txt /root/
RUN /opt/conda/envs/dl/bin/pip install convertdate==2.2.1 LunarCalendar==0.0.9 && \
    /opt/conda/envs/dl/bin/pip install -r /root/requirements.txt && \
    rm -Rf /root/.cache/pip
