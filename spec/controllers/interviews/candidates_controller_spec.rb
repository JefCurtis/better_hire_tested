require "spec_helper"

describe Interviews::CandidatesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:position) { FactoryGirl.create(:position) }
  before do
    sign_in user
  end

  describe "GET #index" do
    it "should assign @candidates" do
      candidate.position = position
      get :index
      expect(assigns(:candidates)) == ([candidate])
    end
    
    
  end

end