class Statement < ActiveRecord::Base
  attr_accessible :answer, :question, :user_id

  validates :question, :presence => true
  validates :question, :length => {:minimum => 5 }
  validates :question, :length => {:maximum => 250 }

  validates :answer, :presence => true

  def self.latest
    Statement.order("id DESC").limit(10)
  end
end
