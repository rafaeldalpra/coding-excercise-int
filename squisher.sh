#!/bin/bash
# Simple script to run the array flattener
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 ruby squisher.rb 