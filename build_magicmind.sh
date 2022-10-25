#!/bin/bash

# Copyright 2022 Cambricon, Inc. All Rights Reserved.

onnx_dir=./examples/aishell/s0/onnx_model/
mm_dir=./examples/aishell/s0/magicmind_model/

# build encoder 
/usr/local/neuware/samples/magicmind/mm_build/build/onnx_build --onnx ${onnx_dir}/encoder.onnx --magicmind_model ${mm_dir}/encoder.magicmind  --build_config ${mm_dir}/encoder_config.json
                                                                                                                                                                     
# build decoder
/usr/local/neuware/samples/magicmind/mm_build/build/onnx_build --onnx ${onnx_dir}/decoder.onnx --magicmind_model ${mm_dir}/decoder.magicmind  --build_config ${mm_dir}/decoder_config.json
