require 'rails_helper'

describe 'Create posts' do
  describe 'while not logged in' do
    it 'should not allow the user to visit the new post page' do
      visit new_post_path
      expect(current_path).to eq(root_path)
      expect(page).to have_content('You are not authorized to perform that action.')
    end
  end

  describe 'while logged in' do
    after(:each) { Warden.test_reset! }

    it 'should allow a user to create a post' do
      login_as create(:author)
      visit new_post_path
      fill_in 'Title', with: 'Post'
      fill_in 'Body', with: 'This is the body'

      click_button 'Save'

      expect(current_path).to eq post_path(Post.first)
      expect(page).to have_content('This is the body')
    end
  end
end
