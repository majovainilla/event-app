require 'rails_helper'

RSpec.describe 'Authentication process' do
  scenario 'Authentication Feature', type: :feature do
    user = User.create(name: "User Example", email: "email")
    visit login_path
    have_link 'Log In', href: login_path
    have_link 'Events', href: events_path
    page.fill_in 'session_name', with: 'User Example'
    click_button 'Log In'
    expect(page.current_path).to eq root_path
    have_link 'Profile', href: user_path(user.id)
    have_link 'Create Event', href: new_event_path
    have_link 'Log out', href: logout_path
    have_link 'Events', href: events_path
    expect(page).to have_text 'Upcoming Events'
    expect(page).to have_text 'Previous Events'
    click_on 'Log out'
    expect(page.current_path).to eq root_path
  end
end
