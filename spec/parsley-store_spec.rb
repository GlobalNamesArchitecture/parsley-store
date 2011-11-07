require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ParsleyStore" do
  it "should intialize ParsleyStore" do
    p = ParsleyStore.new()
    p.is_a?(ParsleyStore).should be_true
  end

  it "should be able to parse a name" do
    p = ParsleyStore.new()
    res = p.parse("Betula verucosa (Linn.) Kunze")
    res[:scientificName][:parsed].should be_true
  end

  it "should be able to parse with only canonical name output" do
    p = ParsleyStore.new()
    res = p.parse("Betula alba Shipunov Kunze 1955", :canonical_only => true)
    res.should == "Betula alba"
  end
end
