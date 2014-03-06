require 'spec_helper'

describe Position do

  let(:position) do
    position = build :position
  end

  it "is valid with name" do
    expect(position).to be_valid
  end

  it "is invalid wihout a name" do
    position.name = ""
    expect(position).to be_invalid
  end 

  

end
