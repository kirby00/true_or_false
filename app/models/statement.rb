class Statement < ActiveRecord::Base
  attr_accessible :answer, :question, :user_id, :id

  validates :question, :presence => true
  validates :question, :length => {:minimum => 5 }
  validates :question, :length => {:maximum => 250 }

  validates_inclusion_of :answer, :in => [true, false]

  def self.latest
    Statement.order("id DESC").limit(10)
  end

  def find_answer(current_user_answers)
    current_user_answers.find {|answer| answer.question_id == id }
  end
end
