class Statement < ActiveRecord::Base
  attr_accessible :answer, :question

  validates :question, :presence => true
  validates :question, :length => {:minimum => 5 }
  validates :question, :length => {:maximum => 250 }

  validates :answer, :presence => true
end
