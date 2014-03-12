# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    title "Blue"
    question nil
    candidate nil
  end
end
