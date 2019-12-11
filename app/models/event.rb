# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event
  has_many :attendees, through: :attendances, source: 'attendee'
  validates :name, :description, :creator_id, presence: true

  scope :previous, -> { where('date < ?', Date.today).order(date: :asc) }
  scope :upcoming, -> { where('date > ?', Date.today).order(date: :asc) }
end
