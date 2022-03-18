require 'rails_helper'

describe 'Home', type: :feature do
  context 'Home page' do
    before :each do
      visit '/'
    end

    it 'should have a title' do
      expect(page).to have_content 'Budget App'
    end

    it 'should have a link to sign in' do
      expect(page).to have_link 'LOG IN'
    end
  end
end
