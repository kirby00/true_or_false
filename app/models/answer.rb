class Answer < ActiveRecord::Base
  attr_accessible :question_id, :user_answer, :user_id

  validates :user_id, :presence => true
  validates :question_id, :presence => true
  validates :user_answer, :presence => true

  def matches_current_user?(statement)
    question_id == statement.id
  end

  def self.user_answers(user_id)
    find_all_by_user_id(user_id)
  end
end
