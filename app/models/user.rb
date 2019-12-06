# frozen_string_literal: true

class User < ApplicationRecord
  has_many :attended_events, through: :attendance, source: :event_id
  has_many :events, foreign_key: :creator
  has_many :attendances, foreign_key: :user_id
  validates :name, :email, presence: true

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
