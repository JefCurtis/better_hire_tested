require "spec_helper"

describe "Candidate" do

  let(:candidate) do
    build :candidate
  end

  it "should exist" do
    expect(Candidate).to be
  end

  it "is invalid without first name" do
    candidate.first_name = nil
    expect(candidate).to be_invalid
  end
  it "is invalid without email" do
    candidate.email = nil
    expect(candidate).to be_invalid
  end
  it "is invalid without phone" do
    candidate.phone = nil
    expect(candidate).to be_invalid
  end

end