require 'rails_helper'

RSpec.describe 'Events process' do
  before :each do
    user = User.create(name: "User Example", email: "email")
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
    expect(page).to have_text 'Event Information'
  end

  scenario 'Attend the event', type: :feature do
    first('.card-title > a').click
    #find(".card-title > a", match: :first).click
  end

end
