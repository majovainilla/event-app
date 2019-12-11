# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
  validates :attended_event, :attendee, presence: true
  validates :attendee, uniqueness: { scope: :attended_event }
end
