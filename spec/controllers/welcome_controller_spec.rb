require 'spec_helper'

describe WelcomeController do
  let(:user) { create(:user) }

  describe "#index" do
    context "singed in" do
      it "is successful" do
        sign_in user
        get :index
        expect(response).to be_redirect
      end
    end

    context "NOT singed in" do
      it "will redirect" do
        sign_out user
        get :index
        expect(response).to be_success
      end
    end

  end

end