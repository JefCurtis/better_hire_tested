module FeatureHelpers
  include Devise::TestHelpers
  def login
    user = FactoryGirl.create(:user)
    sign_in user
  end
end