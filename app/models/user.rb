# frozen_string_literal: true

class User < ApplicationRecord
  # has_many :events, through :users_events
  has_many :events, foreign_key: :creator
  
  
  attr_accessor :remember_token

  def self.digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_token, User.digest(remember_token))
  end
end
