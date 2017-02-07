require 'benchmark'
load 'squisher_monkeypatch.rb'

# Tests
cases = []
cases[1] = [1,2,[3,4],[[5,6],7],3]
cases[2] = [1,2,[3,4]]
cases[3] = [1,"2",[3,4]] # It will not filter out non strings
cases[4] = [1,2,[3,4]]
cases[5] = [1,2,[3,4,[5,6,[7,8,[9,10,[11,12,[13,14,[15,16,[17,18,[19,20]]]]]]]]]]

# Change array index to run different use cases


use_case = cases[5]

puts "Input:"
puts use_case.inspect

puts "Result"
puts (use_case.squish).inspect


Benchmark.bm do |x|
  x.report { use_case.squish }
  x.report { use_case.flatten }
end