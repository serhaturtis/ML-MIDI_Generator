#!/bin/bash

polyphony_rnn_generate \
	--run_dir=./run \
	--hparams="batch_size=128,rnn_layer_sizes=[128,128,128]" \
	--bundle_file=./bundle/polyphony_rnn.mag \
	--save_generator_bundle
