# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "What is your favorite color?"
    completed_at "2014-02-24 23:35:03"
    association :position, factory: :position
  end
end
