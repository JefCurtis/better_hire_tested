# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  
  factory :user do
    first_name "bob"
    last_name "smith"
    sequence (:email) { |n| "bobsmith#{n}@example.com" }
    password "password"
  end
end
