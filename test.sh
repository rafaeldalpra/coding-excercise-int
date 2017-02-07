cd squisher
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 ruby unit_tests.rb
cd ../geofilter
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1 ruby unit_tests.rb
cd ..


