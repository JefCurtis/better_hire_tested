require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "candidate management" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:position) { create :position }
  let!(:candidate) { create :candidate }


  before do
    login_as user, scope: :user
  end

  scenario "A user can create a new interview", js: true do
    # save_and_open_page
    visit "/"
    click_on "Interviews"
    click_on "Create a new interview"
    page.select 'Bob Smith', :from => 'Candidate'
    page.select 'Web Designer', :from => 'Position'
    click_on "Create"
    expect(page).to have_text("Bob Smith")
  end

end
