#! /bin/bash

for filename in tests/*
do
	complete_filename=`readlink -f $filename`
	export lib_dir=`readlink -f lib`
	test_dir=`mktemp -d`
	cd $test_dir
	shd < $complete_filename
done
