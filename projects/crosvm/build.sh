#!/bin/bash -eux
# Copyright 2017 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# Builds fuzzers from within a container into /out/ directory.
# Expects /src/crosvm to contain a crosvm checkout.

cd ${SRC}/crosvm

cargo fuzz build fuzz_qcow
cp ${SRC}/crosvm/fuzz/target/x86_64-unknown-linux-gnu/debug/fuzz_qcow ${OUT}
#for fuzzer in fuzz_qcow fuzz_zimage;
#do
#  cargo fuzz build ${fuzzer}
#  cp ${SRC}/crosvm/fuzz/target/x86_64-unknown-linux-gnu/debug/${fuzzer} ${OUT}
#done
