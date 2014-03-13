# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    title "Blue"
    association :interview, factory: :interview
    association :question, factory: :question
  end
end
