require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "answers management" do
  let(:user) { FactoryGirl.create(:user) }
  let(:position) { FactoryGirl.create(:position) }
  let!(:candidate) { FactoryGirl.create(:candidate, position: position) }
  let(:question) { FactoryGirl.create(:question) }

  before do
    login_as user, scope: :user
  end

  scenario "a user can answer a question succesfully" do

    position.questions << question
    visit interviews_candidates_path
    click_on "Start Interview"
    fill_in "answer_title", with: "Blue"
    click_on "answer_submit_action"
    expect(page).to_not have_selector(".incompleted .panel-group")
    expect(page).to have_selector(".completed .panel-group")
  end



end