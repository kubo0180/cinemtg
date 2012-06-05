class User < ActiveRecord::Base
  has_many :entries
  has_many :books
  has_many :item_users
has_many :items, :through => :item_users
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.image = auth["user_info"]["image"]
      user.name = auth["user_info"]["name"]
      user.screen_name = auth["user_info"]["nickname"]
      user.description = auth["user_info"]["description"]
      user.location = auth["user_info"]["location"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
    end
  end

end
