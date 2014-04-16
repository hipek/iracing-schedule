require 'spec_helper'

describe ScheduleParser do
  subject { described_class.new(fixture_file_upload('files/2014S2.pdf')) }

  it "returns series" do
    subject.read
  end
end