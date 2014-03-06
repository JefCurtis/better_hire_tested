require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user" do
  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
  end

  scenario "when logged in user visits the homepage" do
    visit "/"
    expect(page).to have_content("Dashboard")
  end
end