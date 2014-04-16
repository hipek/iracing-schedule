# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :series_track, :class => 'SeriesTracks' do
    series_id 1
    track_id 1
    name "MyString"
    date "2014-04-16"
    week 1
  end
end
