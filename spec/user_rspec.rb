require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates name and email' do
    user = User.new(name: '', email: '')
    expect(user.valid?).to be(false)
  end

  context 'Associations' do
    it { should have_many(:events).with_foreign_key('creator') }
    it { should have_many(:attendances).with_foreign_key('attendee') }
    it { should have_many(:attended_events).through(:attendances).source(:attended_event) }
  end
end
