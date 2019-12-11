require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'validates presence of name, description and creator' do
    event = Event.new(name: '', description: '', creator_id: '')
    expect(event.valid?).to be(false)
  end

  context 'Associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:attendances).with_foreign_key('attended_event') }
    it { should have_many(:attendees).through(:attendances).source(:attendee) }
  end
end