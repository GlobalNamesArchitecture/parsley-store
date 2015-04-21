describe ParsleyStore do
  subject { ParsleyStore.new }

  describe ".new" do
    it { is_expected.to be_kind_of ParsleyStore }
  end

  describe "#parse"
    
    it "parses a name" do
      res = subject.parse("Betula verucosa (Linn.) Kunze")
      expect(res[:scientificName][:parsed]).to be true
    end

    context "canonical only" do
      it "returns canonical form" do
        res = subject.parse("Betula alba Shipunov Kunze 1955", canonical_only: true)
        expect(res).to eq "Betula alba"
      end
    end
end
