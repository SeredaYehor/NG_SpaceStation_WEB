#!/bin/bash

res=0
python mapLoaderTest.py -v
if [ $? -eq 1 ];
then
	exit 1
fi
python positionTest.py -v
if [ $? -eq 1 ];
then
        exit 1
fi
