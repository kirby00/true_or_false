class User < ActiveRecord::Base

  attr_accessible :provider, :uid, :name

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def self.author(statement)
    self.find_by_id(statement.user_id)
  end
end
