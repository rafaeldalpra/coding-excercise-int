load "squisher_monkeypatch.rb"
require "test/unit"
 
class SquisherTests < Test::Unit::TestCase
 
  def test_nested_array_should_squish
  	array = [1,2,[3,4,[5,6,[7,8,[9,10,[11,12,[13,14,[15,16,[17,18,[19,20]]]]]]]]]]
  	expectation = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    assert_equal(array.squish, expectation)
  end
 
end