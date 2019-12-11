require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context "validations" do
    event = Event.new(name: 'name', description: 'event', creator_id: 1 )
    user = User.create(name: 'name', email: 'email')
    #attendance = user.attended_events << event
    #att = Attendance.new(attended_event_id: 1, attendee_id: 1)

    it {should validate_presence_of(:attended_event_id)}
    it {should validate_presence_of(:attendee_id)}
    it {should validate_uniqueness_of(:attendee_id).scoped_to(:attended_event_id)}
  end

  context 'Associations' do
    it { should belong_to(:attendee).class_name('User') }
    it { should belong_to(:attended_event).class_name('Event') }

  end
end