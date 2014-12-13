class Post < ActiveRecord::Base
  validates_presence_of :title, :link
  acts_as_votable
  has_many :comments
  belongs_to :user
end
