class Question < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :answers
  belongs_to :user

  validates_presence_of :votes, :answers, :user
end
