require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'attributes' do
    before(:each) do
      @comment = build(:comment)
    end

    it 'should have a body, post, and a user' do
      expect(@comment.valid?).to be(true)
    end

    it 'should be invalid without a body' do
      @comment.body = nil
      expect(@comment.invalid?).to be(true)
    end

    it 'should be invalid without a post' do
      @comment.post = nil
      expect(@comment.invalid?).to be(true)
    end

    it 'should be invalid without an author' do
      @comment.author = nil
      expect(@comment.invalid?).to be(true)
    end
  end
end
