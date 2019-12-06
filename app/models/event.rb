# frozen_string_literal: true

class Event < ApplicationRecord
  # has_many :users, through :users_events
  belongs_to :creator, class_name: 'User'
  validates :name, :description, presence: true
end
