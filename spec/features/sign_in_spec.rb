require 'rails_helper'

describe 'Sign In', type: :feature do
  context 'when successfull' do
    before :each do
      user = User.new(name: 'josh', email: 'josh@josh.com', password: '123456', password_confirmation: '123456')
      user.save
      visit 'users/sign_in'
    end

    it 'should see the username and password inputs and the "Log in" button.' do
      expect(page).to have_field('user_email')
      expect(page).to have_field('user_password')
      expect(page).to have_button('Log in')
    end

    it 'should log in successfully' do
      within('form') do
        fill_in 'user_email', with: 'josh@josh.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'Go To Categories'
    end

    it 'should redirects to root path' do
      within('form') do
        fill_in 'user_email', with: 'josh@josh.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
