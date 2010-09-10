require 'socket'

Given /^Redis server is running locally$/ do
  lambda do
    socket = TCPSocket.open('localhost', 6379)
    socket.close
  end.should_not raise_error 
  @conn = Redis.new
end

Then /^I get "([^"]*)" and "([^"]*)" databases connection$/ do |local, slave|
  @conn.select(eval("ParsleyStore::#{slave}")).should == "OK"
  @conn.select(eval("ParsleyStore::#{local}")).should == "OK"
  lambda { @conn.select(200) }.should raise_error
end

Given /^a clean local database$/ do
  @conn = Redis.new
  @conn.select(ParsleyStore::LOCAL)
  @conn.flushdb
  @conn.dbsize.should == 0
  @parser = ParsleyStore.new
end

When /^I parse a name "([^"]*)" two times$/ do |name|
  now = Time.now
  res = @parser.parse(name)
  @delta1 = Time.now - now
  now = Time.now
  res = @parser.parse(name)
  @delta2 = Time.now - now
end

Then /^second parse should be much faster$/ do
  (@delta1/@delta2).should > 10
end

