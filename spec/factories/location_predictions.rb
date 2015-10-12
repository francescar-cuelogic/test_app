FactoryGirl.define do
  factory :location_prediction do
    name "MyString"
    description "MyText"
    association :location, factory: :location
  end
end
