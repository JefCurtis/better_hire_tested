require 'spec_helper'

describe AnswersController do

  describe "GET 'body:text'" do
    it "returns http success" do
      get 'body:text'
      response.should be_success
    end
  end

end
