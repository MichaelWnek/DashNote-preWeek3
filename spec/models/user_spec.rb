require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end

  describe 'attributes' do
    it 'should have a first name, last name, email, and password' do
      expect(@user.valid?).to be(true)
    end

    it 'should be invalid without a first name' do
      @user.first_name = nil
      expect(@user.invalid?).to be(true)
    end

    it 'should be invalid without a last name' do
      @user.last_name = nil
      expect(@user.invalid?).to be(true)
    end

    it 'should be invalid without an email' do
      @user.email = nil
      expect(@user.invalid?).to be(true)
    end

    it 'should be invalid without a password' do
      @user.password = nil
      expect(@user.invalid?).to be(true)
    end
  end

  describe '#full_name' do
    it 'should concatenate the first_name and last_name attributes' do
      expect(@user.full_name).to eq('Jean Luc Picard')
    end
  end
end
