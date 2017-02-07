#!/bin/bash
# Simple script to run the array flattener
cd squisher
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 ruby squisher_tests.rb 
cd ..