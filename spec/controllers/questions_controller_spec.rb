require "spec_helper"

describe QuestionsController do

  let(:user) { create :user }
  let(:position) { create :position }
  before do
    sign_in user
  end

  describe "GET #new" do
    it "should render new page" do

    end
  end

  describe "POST #create" do
    
    describe "when the question is valid" do      
      before do 
        @valid_question_params = { question: {title: "My Fav Color?" } }
      end

      it "should create a question" do
        post :create, @valid_question_params.merge({position_id: position.id})
        expect(position.questions.count).to eq(1)
      end
    end

    describe "when the question is invalid" do

      it "should not create a question" do
        invalid_attr = {question: { title: ""} }
        post :create, position_id: position.id, question: invalid_attr
        expect(position.questions.count).to eq(0)
      end

      it "should display an alert" do
        invalid_attr = {question: { title: ""} }
        post :create, position_id: position.id, question: invalid_attr
        expect(flash[:alert]).to eq("There was an error trying to create your question")
      end
    end
  end

  describe "PUT #update" do
    let(:valid_question_params) do { title: "My second fav Color?" } end
    describe "when the question is valid" do
      it "allows questions to be updated" do
        question = create :question
        position.questions << question
        put :update, position_id: position.id, id: question.id, question: valid_question_params
        question.reload
        expect(question.title).to eq(valid_question_params[:title])
        expect(assigns[:question]).to_not be_new_record
      end
    end
  end
end

  
