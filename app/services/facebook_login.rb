# frozen_string_literal: true

class FacebookLogin < ApplicationService
  def initialize(auth)
    self.auth = auth
    self.user_email = auth.info.email
  end

  attr_accessor :auth, :user_email

  def call
    user = User.find_by(email: user_email) || create_user
  end

  private

  def create_user
    User.new.tap do |user|
      user.email = auth.info.email
      user.password = SecureRandom.base64
      user.skip_confirmation!
      user.save
    end
  end
end
