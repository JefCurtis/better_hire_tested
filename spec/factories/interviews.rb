# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interview do
    # candidate factory: :candidate
    # position factory: :position
    # candidate { FactoryGirl.create(:candidate) }
    position nil
    candidate nil
  end
end
