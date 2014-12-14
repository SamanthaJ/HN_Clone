class Post < ActiveRecord::Base
  validates_presence_of :title, :link
  validates_uniqueness_of :title
  acts_as_votable
  has_many :comments
  belongs_to :user
end
