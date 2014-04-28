require 'spec_helper'

describe SeriesTrack do
  describe "#current?" do
    before do
      subject.date = Date.new(2014, 10, 10)
    end

    def stub_time(*t)
      allow(Time).to receive(:now) { Time.local(*t) }
    end

    context "when now is between week and week + 7" do
      it "returns true" do
        stub_time(2014, 10, 10, 0, 0, 0)
        expect(subject).to be_current
        stub_time(2014, 10, 16, 0, 0, 0)
        expect(subject).to be_current
      end
    end

    context "when now is less then date" do
      it "returns false" do
        stub_time(2014, 10, 9, 23, 58, 0)
        expect(subject).not_to be_current
      end
    end

    context "when now is great then date" do
      it "returns false" do
        stub_time(2014, 10, 17, 0, 1, 0)
        expect(subject).not_to be_current
      end
    end
  end
end
