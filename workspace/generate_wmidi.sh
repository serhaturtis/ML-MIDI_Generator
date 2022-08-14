#!/bin/bash

polyphony_rnn_generate \
	--run_dir=/workspace/run \
	--hparams="batch_size=64,rnn_layer_sizes=[128,128,128]" \
	--output_dir=/workspace/generated \
	--num_outputs=10 \
	--num_steps=256 \
	--primer_midi="/workspace/Empty.mid" \
	--condition_on_primer=true \
	--inject_primer_during_generation=false # true if has to be in
