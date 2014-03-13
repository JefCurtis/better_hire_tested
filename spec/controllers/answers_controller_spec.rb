require "spec_helper"

describe AnswersController do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question) }
  let(:position) { FactoryGirl.create(:position) }
  let(:candidate) { FactoryGirl.create(:candidate)}
  let(:interview) { FactoryGirl.build(:interview)}
  let(:answer) { FactoryGirl.build(:answer) }

  before do
    sign_in user
  end

  describe "POST #create" do
    
    
    describe "the answer is valid" do
      before do
        interview_1 = create :interview, candidate_id: candidate.id, position_id: position.id
        @valid_answer_params = { answer: { title: "I like blue", interview_id: interview_1.id }  }
      end

      it "should save the answer" do
        question = create :question, position: position
        post :create, @valid_answer_params.merge({ question_id: question.id })
        expect(question.answers.count).to eq(1)
      end
    end

    describe "the answer is invalid" do
      before do
        interview = create :interview, candidate_id: candidate.id, position_id: position.id
        @invalid_answer_params =  { title: "", interview_id: interview.id }
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
      let(:interview) {  create :interview, candidate: candidate, position: position }
    before do
      @valid_answer_params = { title: "updated answer", interview_id: interview.id }
    end

    it "should assign params title to be answer title" do
      question = create :question, position: position
      answer = create :answer, question: question, interview: interview
      put :update, question_id: question.id, id: answer.id, answer: @valid_answer_params
      expect(assigns[:answer][:title]).to eq("updated answer")
    end

    it "should not create a new record" do
      question = create :question, position: position
      answer = create :answer, question: question, interview: interview
      put :update, question_id: question.id, id: answer.id, answer:  @valid_answer_params
      expect(question.answers.count).to eq(1)

    end

  end

end