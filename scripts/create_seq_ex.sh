#!/bin/bash

polyphony_rnn_create_dataset \
	--input=./note_seq/notesequences.tfrecord \
	--output_dir=./seq_ex \
	--eval_ratio=0.10
