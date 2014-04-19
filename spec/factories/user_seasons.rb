# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_season do
    user_id 1
    season_id 1
    series_names "MyString"
  end
end
