# Copyright 2017 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# Defines a docker image that can build cras fuzzers.
#
FROM gcr.io/oss-fuzz-base/base-builder

RUN apt-get -y update && \
      apt-get install -y \
      build-essential \
      curl \
      g++ \
      git \
      llvm \
      clang \
      libcap-dev
RUN apt-get clean

RUN curl https://sh.rustup.rs > /tmp/rustup.sh
RUN sh /tmp/rustup.sh -y --default-toolchain nightly
ENV PATH="${PATH}:/root/.cargo/bin"

RUN cd /tmp && git clone https://android.googlesource.com/platform/external/minijail && \
      cd minijail && \
      OUT=$(pwd) make && \
      cp *.so /usr/lib

RUN cargo install --force --git https://github.com/dgreid/cargo-fuzz --branch build_subcommand

#RUN cd $SRC && git clone https://chromium.googlesource.com/chromiumos/platform/crosvm
RUN cd $SRC && git clone https://github.com/dgreid/crosvm && cd crosvm && git checkout fuzz_virtio
WORKDIR crosvm
COPY build.sh $SRC/
