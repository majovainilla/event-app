# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendees, through: :attendance, source: :user_id
  has_many :attendances, foreign_key: :event_id
  belongs_to :creator, class_name: 'User'
  validates :name, :description, presence: true
end
