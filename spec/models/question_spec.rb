require 'spec_helper'

describe Question do

  let(:question) do
    build :question
  end

  it "is valid with name" do
    expect(question).to be_valid
  end

  it "is invalid wihout a name" do
    question.title = ""
    expect(question).to be_invalid
  end 
end
