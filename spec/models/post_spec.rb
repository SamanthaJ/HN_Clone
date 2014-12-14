require 'rails_helper'

describe Post do 
  it "has a valid factory" do 
    
    expect(build(:post)).to be_valid
  end

  it "is invalid without a title" do 
    post = build(:post, title: nil)
    post.valid?
    
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a link" do 
    post = build(:post, link: nil)
    post.valid?
    
    expect(post.errors[:link]).to include("can't be blank")
  end
end