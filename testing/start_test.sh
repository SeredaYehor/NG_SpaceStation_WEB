#!/bin/bash

python -m coverage run mapLoaderTest.py -v
if [ $? -eq 1 ];
then
	exit 1
fi
python -m coverage run positionTest.py -v
if [ $? -eq 1 ];
then
        exit 1
fi
python -m coverage report -m
