require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "candidate management" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as user, scope: :user
  end
  
  scenario "A user can create a candidate" do
    visit positions_path
    click_on "Candidates"
    click_on "Add a candidate"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "johndoe@example.com"
    fill_in "Phone", with: "604-555-5555"
    fill_in "Address", with: "45 5th Ave Burnaby BC"
    click_on "Create"
    expect(page).to have_text("John Doe johndoe@example.com 604-555-5555 45 5th Ave Burnaby BC")
  end

  scenario "A user can edit a candidate" do
    visit positions_path
    click_on "Candidates"
    click_on "Add a candidate"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "johndoe@example.com"
    fill_in "Phone", with: "604-555-5555"
    fill_in "Address", with: "45 5th Ave Burnaby BC"
    click_on "Create"
    expect(page).to have_text("John Doe johndoe@example.com 604-555-5555 45 5th Ave Burnaby BC")    
  end

  
end