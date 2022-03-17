require 'rails_helper'

describe 'Entity', type: :model do
  before :each do
    @user = User.new(name: 'josh', email: 'josh@josh.com', password: '123456', password_confirmation: '123456')
    @user.save
  end

  subject do
    Entity.new(name: 'Test entity', author_id: @user.id, amount: 123)
  end
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
end
