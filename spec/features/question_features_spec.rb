require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature :question do
  let(:user) { FactoryGirl.create(:user) }
  let(:position) { FactoryGirl.create(:position) }

  before do
    login_as user, scope: :user

  end

 scenario "A user creates a question successfully" do
    create :position
    visit positions_path
    click_on "details"
    click_on "Add a question"
    fill_in "Title", with: "What is your favorite color?"
    click_on "Create"
    expect(page).to have_text("Your question has been added")
  end

  scenario "a user doesn't create a question successfully" do
    create :position
    visit positions_path
    click_on "details"
    click_on "Add a question"
    fill_in "Title", with: ""
    click_on "Create"
    expect(page).to have_text("There was an error trying to create your question")
  end

  scenario "a user edits a question successfully" do
    create :question
    visit positions_path
    click_on "details"
    click_on "edit"
    fill_in "Title", with: "Changed question"
    click_on "Update"
    expect(page).to have_text("Your question has been updated")
  end

  scenario "a user doesn't edit a question successfully" do
    create :question
    visit positions_path
    click_on "details"
    click_on "edit"
    fill_in "Title", with: ""
    click_on "Update"
    expect(page).to have_text("There was an error editing your question")

  end

end
  