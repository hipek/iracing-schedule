require 'spec_helper'

describe Season do
  before(:all) do
    @season = described_class.new file: fixture_file_upload('files/2014S2.pdf')
    expect(@season).to be_valid
  end

  after(:all) { Track.delete_all }

  it "has season name" do
    expect(@season.name).to eql("2014 Season 2")
  end

  it "has 36 series" do
    expect(@season.series.size).to eql(36)
  end

  it "has 12 tracks in series tracks" do
    @season.series.each do |series|
      expect(series.series_tracks.size).to eql(12)
    end
  end
end
