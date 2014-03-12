require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature :position do
  let(:user)     { FactoryGirl.create(:user) }
  let(:position) { create :position }

  before do
    login_as user, scope: :user
  end
  
  scenario "A user creates a position successfully" do
    visit positions_path
    click_on "Add a job position"
    fill_in "Name", with: "Web Designer"
    fill_in "Description", with: "Someone with a little sense of design!"
    click_on "Create"
    expect(page).to have_text("Web Designer template")
  end

  scenario "A user receives an error while trying to create a invalid position" do
    visit positions_path
    click_on "Add a job position"
    fill_in "Name", with: ""
    fill_in "Description", with: "Someone with a little sense of design!"
    click_on "Create"
    expect(page).to have_text("There was an error when creating your job position")
  end

  scenario "A user goes to the show page and sees the position name" do
    position = create :position, name: "Web Designer"
    visit position_path(position)
    expect(page).to have_text("Web Designer")
  end

  scenario "A user can view a position show page" do
    position
    visit positions_path
    click_on "view questions"
    expect(page).to have_text("#{position.name}")
  end

  scenario "A user can edit a position name" do
    visit position_path(position)
    first(:link, "Edit").click
    fill_in "Name", with: "UX Designer"
    click_on "Update"
    expect(page).to have_text("UX Designer")
  end

  scenario "A user can delete a position", js: true do 
    visit edit_position_path(position)
    click_on "Delete"
    page.driver.browser.accept_js_confirms
    expect(page).to have_text("Your job position has been deleted.")
  end

  scenario "A user can add a candidate to a job position successfully", js: true do
    candidate = create :candidate
    visit position_path(position)
    find(".btn-primary").click
    check "Bob Smith"
    click_on "Update Position"
    visit candidates_path
    click_on "Bob Smith"
    expect(page).to have_text(position.name)
  end
  
end
