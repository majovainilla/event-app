# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'CreateEvents', type: :feature do
  before :each do
    user = User.create(name: 'User Example', email: 'email')
    event = user.events.build(name: 'Event testing', description: 'Event description',
                              date: '05/05/2020', location: 'Home')
    event.save
    visit login_path
    page.fill_in 'session_name', with: 'User Example'
    click_button 'Log In'
  end

  scenario 'Event creation', type: :feature do
    click_on 'Create Event'
    page.fill_in 'event_name', with: 'Event name'
    page.fill_in 'event_description', with: 'Event description'
    page.fill_in 'event_date', with: '12/12/2019'
    page.fill_in 'event_location', with: 'Event location'
    click_button 'Create my event'
    expect(page).to have_text 'Event successfully created'
  end

  scenario 'Attend the event', type: :feature do
    click_link('Event testing')
    expect(page.current_path).to eq '/events/1'
    click_link('Attend Event')
    expect(page).to have_text 'Congratulations you are in the list'
    expect(page).not_to have_button('Attend Event')
  end
end
