class User < ActiveRecord::Base
  has_many :answers
  has_many :questions
  has_many :votes
end
