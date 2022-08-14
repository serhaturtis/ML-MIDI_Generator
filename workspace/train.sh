#!/bin/bash

rm -rf ./note_seq
rm -rf ./seq_ex

convert_dir_to_note_sequences \
	--input_dir=/workspace/midi_src \
	--output_file=/workspace/note_seq/notesequences.tfrecord \
	--recursive

polyphony_rnn_create_dataset \
	--input=/workspace/note_seq/notesequences.tfrecord \
	--output_dir=/workspace/seq_ex \
#	--eval_ratio=0.10

polyphony_rnn_train \
	--run_dir=/workspace/run \
	--sequence_example_file=/workspace/seq_ex/training_poly_tracks.tfrecord \
	--hparams="batch_size=64, rnn_layer_sizes=[128,128,128]" \
	--num_training_steps=10000 &

#polyphony_rnn_train \
#	--run_dir=/workspace/run \
#	--sequence_example_file=/workspace/seq_ex/training_poly_tracks.tfrecord \
#	--hparams="batch_size=64, rnn_layer_sizes=[128,128,128]" \
#	--num_training_steps=10000 \
#	--eval &

tensorboard --logdir=/workspace --bind_all &

wait
