require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "answers management" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:position) { FactoryGirl.create(:position) }
  let!(:candidate) { FactoryGirl.create(:candidate) }
  let(:question) { FactoryGirl.create(:question) }
  let!(:interview) { FactoryGirl.create(:interview, candidate: candidate, position: position) }

  before do
    login_as user, scope: :user
  end

  scenario "a user can answer a question succesfully", js: true do
    position.questions << question
    visit interviews_path
    click_on "Start"
    fill_in "answer_title", with: "Blue"
    save_and_open_page
    click_on "Create Answer"
    expect(page).to_not have_selector(".incompleted .panel-group")
    expect(page).to have_selector(".completed .panel-group")
  end



end