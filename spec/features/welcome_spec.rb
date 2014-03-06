require 'spec_helper'

feature "welcome" do
  scenario "when a user not logged in goes to the homepage" do

    visit "/"
    expect(page).to have_content("a better hire")
  end
end