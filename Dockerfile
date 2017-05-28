FROM ubuntu:17.10

# Distribution-level dependencies
RUN \
     apt-get update \
  && apt-get -y install \
       curl \
       git \
       wget \
       make \
       libncurses-dev \
       flex \
       bison \
       gperf \
       python \
       python-serial \
  && mkdir /esp

# ESP32 toolchain
WORKDIR /esp
RUN \
     curl https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz | tar xzf -

# esp-idf
RUN \
     git clone --recursive https://github.com/espressif/esp-idf.git

ENV \
  PATH=$PATH:/esp/xtensa-esp32-elf/bin \
  IDF_PATH=/esp/esp-idf

