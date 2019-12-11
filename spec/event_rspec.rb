require 'rails_helper'

RSpec.describe Event type: :model do
  it 'validates presence of name, description and creator' do
    event = Event.new(name: '', description: '', creator: '')
    expect(event.valid?).to be(false)
  end
end