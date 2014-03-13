require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature :question do
  let(:user) { FactoryGirl.create(:user) }
  let!(:position) { FactoryGirl.create(:position) }

  before do
    login_as user, scope: :user
    create :question, position: position
  end

 scenario "A user creates a question successfully" do
    visit positions_path
    first(:link, "view questions").click
    first(:link, 'Add a question').click
    fill_in "Title", with: "What is your favorite color?"
    click_on "Create"
    expect(page).to have_text("Your question has been added")
  end

  scenario "a user doesn't create a question successfully" do
    visit positions_path
    first(:link, "view questions").click
    first(:link, 'Add a question').click
    fill_in "Title", with: ""
    click_on "Create"
    expect(page).to have_text("There was an error trying to create your question")
  end

  # scenario "a user edits a question successfully", js: true do
    
  #   visit position_path(position)
  #   first(:link, "Edit").click
  #   fill_in "question_title", with: "Changed question"
  #   click_on "Update Position"
  #   expect(page).to have_text("Your question has been updated")
  # end

  scenario "a user doesn't edit a question successfully", js: true do
    visit position_path(position)
    within(".edit-question") do
      click_on("Edit")
    end
    fill_in "Title", with: ""
    click_on "Update Question"
    expect(page).to have_text("is too short (minimum is 5 characters) and can't be blank")

  end

end
  