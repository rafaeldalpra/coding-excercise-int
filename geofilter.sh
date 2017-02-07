#!/bin/bash
# Simple script to run the array flattener
cd geofilter
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 ruby geofilter_tests.rb 
cd ..