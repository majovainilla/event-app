require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context "validations" do
    it { should validate_presence_of(:attended_event_id) }
    it { should validate_presence_of(:attendee_id) }
    it { should validate_uniqueness_of(:attendee_id).scoped_to(:attended_event_id) }
  end

  context 'Associations' do
    it { should belong_to(:attendee).class_name('User') }
    it { should belong_to(:attended_event).class_name('Event') }
  end
end
