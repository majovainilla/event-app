# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event
  has_many :attendees, through: :attendances, source: 'attendee'

  validates :name, :description, presence: true
  scope :previous, -> { where('date < ?', Date.today).order(date: :asc) }
  scope :upcoming, -> { where('date > ?', Date.today).order(date: :asc) }

  # def self.previous_events
  # @previous_events = Event.where('date < ?', Date.today).order(:date)

  # end

  # def self.upcoming_events
  # @upcoming_events = Event.where('date > ?', Date.today)}

  # end
end
