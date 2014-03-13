require "spec_helper"

describe InterviewsController do
  let(:position) { FactoryGirl.create(:position) }
  let(:candidate) { FactoryGirl.create(:candidate)}
  let(:interview) { FactoryGirl.build(:interview)}
  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
  end

  describe "Get#index" do
    it "should be success" do
      get :index
      expect(response).to be_success
    end

    it "should assign @interviews" do
      interview = create :interview, candidate: candidate, position: position
      get :index
      expect(assigns(:interviews)).to eq([interview])
    end
  end

  describe "Post#create" do
    let(:valid_interview_params) { {interview: {candidate_id: candidate.id, position_id: position.id }} }

    it "should create a interview" do
      post :create, valid_interview_params
      expect(Interview.count).to eq(1)
    end

    it "should fail to create if position_id is not unique" do
      create :interview, candidate: candidate, position: position
      post :create, interview: { position_id: position.id, candidate_id: candidate.id }
      expect(Interview.count).to eq(1)
    end

    
  end

end
