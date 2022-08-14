#!/bin/bash

polyphony_rnn_generate \
	--run_dir=/workspace/run \
	--hparams="batch_size=64,rnn_layer_sizes=[128,128,128]" \
	--output_dir=/workspace/generated \
	--num_outputs=10 \
	--num_steps=128 \
	--primer_pitches="[67,64,60]" \
	--condition_on_primer=false \
	--inject_primer_during_generation=true # true if has to be in
