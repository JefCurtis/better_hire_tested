require "spec_helper"

describe "Answer" do

  let(:answer) do
    build :answer
  end
  let(:question) { create :question }
  let(:interview) { create :interview }

  it "should exist" do
    expect(Answer).to be
  end

  it "is invalid without title" do
    answer.title = nil
    expect(answer).to be_invalid
  end

  it "is valid it has a question_id" do
    answer = create :answer, question: question, interview: interview
    expect(answer).to be_valid
  end

  it "is invalid without a question_id" do
    answer.question = nil
    expect(answer).to be_invalid
  end
end