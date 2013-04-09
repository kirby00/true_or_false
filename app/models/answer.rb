class Answer < ActiveRecord::Base
  attr_accessible :question_id, :user_answer, :user_id

  validates :user_id, :presence => true
  validates :question_id, :presence => true
  validates :user_answer, :presence => true
end
