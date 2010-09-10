require 'socket'

Given /^Redis server is running locally$/ do
  lambda do
    socket = TCPSocket.open('localhost', 6379)
    socket.close
  end.should_not raise_error 
  @conn = Redis.new
end

Then /^I get "([^"]*)" and "([^"]*)" databases connection$/ do |local, slave|
  @conn.select(eval("ParsleyStore::#{local}")).should == "OK"
  @conn.select(eval("ParsleyStore::#{slave}")).should == "OK"
  lambda { @conn.select(200) }.should raise_error
end
