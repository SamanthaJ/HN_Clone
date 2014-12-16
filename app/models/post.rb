class Post < ActiveRecord::Base
  validates_presence_of :title, :link
  acts_as_votable
  has_many :comments
  belongs_to :user

  def user_activity
    upvotes * 3 + comments.count
  end
end
