# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :candidate do
    first_name "Bob"
    last_name "Smith"
    email "bobsmith@example.com"
    address "45 5th Ave Burnaby BC"
    phone "604-555-5555"
  end
end
