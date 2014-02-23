require 'spec_helper'

feature "welcome" do
  scenario "when a user not logged goes to homepage" do
    visit "/"
    expect(page).to have_content("Let us help you hire")
  end
end