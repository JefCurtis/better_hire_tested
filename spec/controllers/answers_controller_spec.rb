require "spec_helper"

describe AnswersController do
  let(:user) { FactoryGirl.create(:user) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:question) { FactoryGirl.create(:question) }
  let(:answer) { FactoryGirl.build(:answer) }
  let(:position) { FactoryGirl.build(:position) }

  before do
    sign_in user
  end

  describe "POST #create" do
    
    describe "the answer is valid" do
      before do
         @valid_answer_params = { answer: { title: "I like blue", candidate_id: candidate.id } }
      end
      it "should save the answer" do
        question = create :question, position: position
        post :create, @valid_answer_params.merge({question_id: question.id })
        expect(question.answers.count).to eq(1)
      end
    end

    describe "the answer is invalid" do
      before do
         @invalid_answer_params =  { title: "", candidate_id: candidate.id }
      end
      it "should not create a new answer" do
        question = create :question, position: position
        post :create, question_id: question.id, answer: @invalid_answer_params
        expect(question.answers.count).to eq(0)        
      end
      it "should render :edit" do
        question = create :question, position: position
        post :create, question_id: question.id, answer: @invalid_answer_params, format: :js
        expect(response).to render_template(:new)        

      end
    end
  end

  describe "PUT #update" do
    before do
       @valid_answer_params = { title: "updated answer", candidate_id: candidate.id }
    end

    it "should assign params title to be answer title" do
      question = create :question, position: position
      answer = create :answer, question: question, candidate: candidate
      put :update, question_id: question.id, id: answer.id, answer: @valid_answer_params
      expect(assigns[:answer][:title]).to eq("updated answer")
    end

    it "should not create a new record" do
      question = create :question, position: position
      answer = create :answer, question: question, candidate: candidate
      put :update, question_id: question.id, id: answer.id, answer:  @valid_answer_params
      expect(question.answers.count).to eq(1)

    end

  end

end