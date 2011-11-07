$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'parsley-store'
require 'rspec'

puts "You need to start Redis server on your machine"

RSpec.configure do |config|
  
end
