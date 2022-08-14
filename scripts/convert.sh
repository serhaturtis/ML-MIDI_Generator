#!/bin/bash

convert_dir_to_note_sequences \
	--input_dir=./midi_src \
	--output_file=./note_seq/notesequences.tfrecord \
	--recursive
