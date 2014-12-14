class Comment < ActiveRecord::Base
  validates_presence_of :body
  validates_uniqueness_of :body
  acts_as_votable
  belongs_to :user
  belongs_to :post
end
