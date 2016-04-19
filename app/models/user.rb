class User < ActiveRecord::Base
  def self.find_or_create_with_auth(token, user_info)
    where(uid: user_info[:uid]).first_or_create do |new_user|
      new_user.access_token     = token[:access_token]
      new_user.refresh_token    = token[:refresh_token]
      new_user.email            = user_info[:email]
      new_user.uid              = user_info[:uid]
      new_user.first_name       = user_info[:first_name]
      new_user.last_name        = user_info[:last_name]

    end
  end
end
