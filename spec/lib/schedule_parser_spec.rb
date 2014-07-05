require 'rails_helper'

describe ScheduleParser do
  subject { described_class.new(fixture_file_upload('files/2014S2.pdf')) }

  it "returns series" do
    expect(subject.series.size).to eql(36)
  end
end