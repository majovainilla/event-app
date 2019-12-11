# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
  validates :attended_event_id, :attendee_id, presence: true
  validates_uniqueness_of :attendee_id, scope: :attended_event_id
end
