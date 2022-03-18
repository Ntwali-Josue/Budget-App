require 'rails_helper'

describe 'Category Index', type: :feature do
  context 'when successfull' do
    before :each do
      user = User.new(name: 'josh', email: 'josh@josh.com', password: '123456', password_confirmation: '123456')
      user.save
      visit 'users/sign_in'

      within('form') do
        fill_in 'user_email', with: 'josh@josh.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      visit '/'
      find('#go-categories').click
      visit '/categories'
    end

    it 'should see the categories index page' do
      expect(page).to have_content 'Your Categories'
    end

    it 'should see the "Add Category" button' do
      button = find('#add')
      expect(button).to be_truthy
      expect(button).to have_content 'ADD NEW CATEGORY'
    end
  end
end
