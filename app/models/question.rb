class Question < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :answers
  belongs_to :user

end
