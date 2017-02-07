load "geofilter.rb"
require "test/unit"
 
class GeofilterTests < Test::Unit::TestCase
 
 	# Should load 32 users
  def test_geofilter_should_load_users
  	users = load_users
    assert_equal(users.count, 32)
  end

 	# Should filter 16 users
  def test_geofilter_should_return_16_users_in_100km
  	users = filter_users_by_radius(load_users, 100)
    assert_equal(users.count, 16)
  end
 
end