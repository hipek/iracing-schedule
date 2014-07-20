require 'rails_helper'

describe ScheduleParser do
  subject { described_class.new(fixture_file_upload('files/2014S2.pdf')) }

  it "returns series" do
    expect(subject.series.size).to eql(36)
  end

  it "has correct series names" do
    expect(subject.series.map(&:series_name)).to include('iRacing Global Challenge - Fixed')
  end
end