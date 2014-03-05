require 'spec_helper'

describe Positions::CandidatesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:position) { FactoryGirl.create(:position) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  before do
    sign_in user
  end

  describe "GET #index" do
    it "should assign @position" do
      get :index, position_id: position.id
      expect(assigns(:position)).to eq(position)
    end
  end
  describe "GET #index" do
    it "should be successful" do
      get :index, position_id: position.id
      expect(response).to be_success
    end
  end
end