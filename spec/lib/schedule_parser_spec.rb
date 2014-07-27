require 'rails_helper'

describe ScheduleParser do
  before(:all) do
    @series = described_class.new(
      fixture_file_upload('files/2014S3.pdf')
    ).series
  end

  it "returns series" do
    expect(@series.size).to eql(37)
  end

  it "has correct series names" do
    expect(@series.map(&:series_name)).to include('iRacing Global Challenge - Fixed')
  end

  it "has license" do
    expect(@series.map(&:license).sort.uniq).to eql(%w'A B C D R')
  end

  it "has race type" do
    expect(@series.map(&:race_type).sort.uniq).to eql(%w'OVAL ROAD')
  end

  it "has cars" do
    expect(@series.map(&:cars).sort.uniq).to eql([
      ["Cadillac CTS-V Racecar", "Kia Optima"],
      ["Chevrolet Corvette C6R"],
      ["Chevrolet Impala Class B", "Ford Mustang Class B"],
      ["Chevrolet Monte Carlo SS"],
      ["Chevrolet National Impala"],
      ["Chevrolet SS-Gen6", "Ford Fusion-Gen6", "Toyota Camry-Gen6"],
      ["Chevrolet Silverado"],
      ["Dallara DW12"],
      ["Ford Falcon FG01 V8"],
      ["Legends Ford '34 Coupe"],
      ["Lotus 49"],
      ["Lotus 79"],
      ["Mazda MX-5 Cup"],
      ["Mazda MX-5 Cup", "Mazda MX-5 Roadster"],
      ["McLaren MP4-12C GT3", "Ruf RT 12R Track", "BMW Z4 GT3"],
      ["Modified - SK"],
      ["Modified - Tour"],
      ["Pontiac Solstice", "Mazda MX-5 Roadster"],
      ["Pontiac Solstice", "VW Jetta TDI Cup", "Ford Mustang FR500S"],
      ["Radical SR8"],
      ["Riley MkXX Daytona Prototype", "HPD ARX-01c", "Ford GT", "Ruf RT 12R C-"],
      ["Ruf RT 12R C-Spec"],
      ["SCCA Spec Racer Ford"],
      ["Silver Crown"],
      ["Skip Barber Formula 2000"],
      ["Sprint Car"],
      ["Star Mazda"],
      ["Street Stock"],
      ["Super Late Model"],
      ["Williams-Toyota FW31"]
    ])
  end
end
