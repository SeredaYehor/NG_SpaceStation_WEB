#!/bin/bash

res=0
python mapLoaderTest.py -v
if [ $? -eq 1 ];
then
	$res = 1
fi
python positionTest.py -v
if [ $? -eq 1 ];
then
        $res = 1
fi
exit $res
