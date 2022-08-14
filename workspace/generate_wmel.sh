#!/bin/bash

polyphony_rnn_generate \
	--run_dir=/workspace/run \
	--hparams="batch_size=64,rnn_layer_sizes=[128,128,128]" \
	--output_dir=/workspace/generated \
	--num_outputs=10 \
	--num_steps=128 \
	--primer_melody="[0, -2, -2, -2, 60, -2, -2, -2, 67, -2, -2, -2, 67, -2, -2, -2]" \
	--condition_on_primer=false \
	--inject_primer_during_generation=true # true if melody has to be in
