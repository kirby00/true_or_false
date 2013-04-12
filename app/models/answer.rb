class Answer < ActiveRecord::Base
  attr_accessible :question_id, :user_answer, :user_id

  validates :user_id, :presence => true
  validates :question_id, :presence => true
  validates_inclusion_of :user_answer, :in => [true, false]

  def matches_current_user?(statement)
    question_id == statement.id
  end

  def self.user_answers(user_id)
    find_all_by_user_id(user_id)
  end

  def self.number_of_answers(statement)
    self.where(:question_id => statement.id).count
  end
end
