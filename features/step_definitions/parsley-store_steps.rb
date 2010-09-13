require 'socket'

Given /^Redis server is running locally$/ do
  lambda do
    socket = TCPSocket.open('localhost', 6379)
    socket.close
  end.should_not raise_error 
  @conn = Redis.new
end

Then /^I get "([^"]*)" and "([^"]*)" databases connection$/ do |local, slave|
  @local_db = 10
  @slave_db = 11
  @conn.select(@slave_db).should == "OK"
  @conn.select(@local_db).should == "OK"
  lambda { @conn.select(200) }.should raise_error
end

Given /^a clean local database$/ do
  @conn = Redis.new
  @conn.select(@local_db)
  @conn.flushdb
  @conn.dbsize.should == 0
  @parser = ParsleyStore.new(@local_db, @slave_db)
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
  # puts "%s/%s=%s", [@delta1, @delta2, @delta1/@delta2]
  (@delta1/@delta2).should > 10
end

