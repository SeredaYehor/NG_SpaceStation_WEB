#!/bin/bash

python -m coverage run mapLoaderTest.py -v
python -m coverage report -m
python -m coverage html
if [ $? -eq 1 ];
then
	exit 1
fi

python -m coverage run positionTest.py -v
python -m coverage report -m
python -m coverage html
if [ $? -eq 1 ];
then
        exit 1
fi
