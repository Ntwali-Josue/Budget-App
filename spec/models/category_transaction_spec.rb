require 'rails_helper'

describe 'Category', type: :model do
  before :each do
    @user = User.new(name: 'josh', email: 'josh@josh.com', password: '123456', password_confirmation: '123456')
    @user.save
  end

  subject do
    Category.new(name: 'Test Category', author_id: @user.id,
                 icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/2048px-User_icon_2.svg.png')
  end
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
end
