class Answer < ActiveRecord::Base
    belongs_to :question
    belongs_to :user
    has_many :votes, as: :voteable

    validates_presence_of :question_id, :user_id
end
