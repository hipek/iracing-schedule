# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :srs_track_value do
    user_id 1
    series_track_id 1
    value "MyString"
  end
end
