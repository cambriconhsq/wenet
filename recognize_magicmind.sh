#!/bin/bash

# Copyright 2022 Cambricon, Inc. All Rights Reserved.

dir=./example/aishell/s0/
mm_dir=./example/aishell/s0/magicmind_model/

# attention_rescoring
python wenet/bin/recognize_magicmind.py \
  --config     ./example/aishell/s0/conf/train_conformer.yaml \
  --test_data  ./example/aishell/s0/data/test/data.list \
  --dict       $dir/words.txt \
  --mode       attention_rescoring \
  --encoder_magicmind $mm_dir/encoder.magicmind  \
  --decoder_magicmind $mm_dir/decoder.magicmind  \
  --result_file mm_log

# # ctc_prefix_beam_search 
# python wenet/bin/recognize_magicmind.py \
#   --config     ./asr_example/aishell/s0/conf/train_conformer.yaml \
#   --test_data  ./asr_example/aishell/s0/data/test/data.list \
#   --dict       $dir/units.txt \
#   --mode       ctc_prefix_beam_search \
#   --encoder_magicmind $mm_dir/encoder.magicmind  \
#   --decoder_magicmind $mm_dir/decoder.magicmind  \
#   --result_file mm_log






