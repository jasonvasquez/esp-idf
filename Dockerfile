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

ENV \
  ESP32_TOOLCHAIN_URL=https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-73-ge28a011-5.2.0.tar.gz \
  ESP_IDF_SHA=e6afe28bafe5db5ab79fae213f2e8e1ccd9f937c

# ESP32 toolchain
WORKDIR /esp
RUN \
     curl $ESP32_TOOLCHAIN_URL | tar xzf -

# esp-idf
RUN \
     git clone --recursive https://github.com/espressif/esp-idf.git \
  && cd /esp/esp-idf \
  && git reset --hard $ESP_IDF_SHA

ENV \
  PATH=$PATH:/esp/xtensa-esp32-elf/bin \
  IDF_PATH=/esp/esp-idf

WORKDIR /esp
