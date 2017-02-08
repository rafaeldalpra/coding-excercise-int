# Array#squish

An alternative to Ruby's `Array.flatten` method. 

To change test use case: `squisher_use_cases.rb`

### To run the Docker setup included:

`sh squisher.sh`

### To run elsewhere:

`ruby squisher/squisher_use_cases.rb`

# Geofilter#distance

`around_dublin_office ` 

Takes a file with user records in JSON format.

Returns a human-friendly list of users within the radius informed (100km in the example)

To change radius: `geofilter_use_case.rb`

### To run the Docker setup included:

`sh geofilter.sh`

### To run elsewhere:

`ruby geofilter/geofilter_use_case.rb`

# Testing

`sh test.sh` will automatically load and run the tests for both "features"