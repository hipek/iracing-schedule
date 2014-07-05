require 'rails_helper'

describe User do
  describe "#tracks_ids" do
    let(:track_ids) {}

    before do
      subject.track_ids = {
        '4321' => 'own',
        '12'   => 'to_buy'
      }
    end

    it "has json" do
      expect(subject.read_attribute(:track_ids)).to eql(
        '{"4321":"own","12":"to_buy"}'
      )
    end

    it "returns parsed json" do
      expect(subject.track_ids).to be_kind_of(Hash)
    end

    it "has track owned ids" do
      expect(subject.track_owned_ids).to eql([4321])
    end
  end
end
