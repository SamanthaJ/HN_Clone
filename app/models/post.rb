class Post < ActiveRecord::Base
  acts_as_votable
  has_many :comments
  belongs_to :user
  acts_as_commentable
end
