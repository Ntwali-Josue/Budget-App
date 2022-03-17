# rubocop:disable Metrics/BlockLength

require 'rails_helper'

describe 'Category show', type: :feature do
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
      category = Category.new(id: 1, author_id: user.id, name: 'Test Category',
                              icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/2048px-User_icon_2.svg.png')
      category.save
      visit '/categories/1'
    end

    it 'should see the category show page' do
      expect(page).to have_content 'Your Transactions'
    end

    it 'should see the category name' do
      expect(page).to have_content 'Test Category'
    end

    it 'should see the category icon' do
      expect(page).to have_css('img[src*="https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/2048px-User_icon_2.svg.png"]')
    end

    it 'should see the transactions section' do
      expect(page).to have_content 'There Is No Transactions'
    end

    it 'should see the "Add Transaction" button' do
      button = find('#add')
      expect(button).to be_truthy
      expect(button).to have_content 'ADD TRANSACTION'
    end
  end
end

# rubocop:enable Metrics/BlockLength
