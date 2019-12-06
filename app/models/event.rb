# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event
  has_many :attendees, through: :attendances, source: 'attendee'

  validates :name, :description, presence: true

  def past?
    true if self.date < Time.now
    false
  end
end
