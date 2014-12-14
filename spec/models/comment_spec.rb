require 'rails_helper'

describe Comment do 
  it "has a valid factory" do
    
    expect(build(:comment)).to be_valid
  end
  
  it "is invalid without a body" do
    comment = build(:comment, body: nil)
    comment.valid?
    
    expect(comment.errors[:body]).to include("can't be blank")
  end
end
