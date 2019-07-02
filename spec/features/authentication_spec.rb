require 'rails_helper'

describe 'authentication' do
  before(:each) do
    @user = create(:user)
    visit root_path
  end

  describe 'when signing in' do
    describe 'on successful sign in' do
      it 'should redirect to the posts index page' do
        within('.nav') do
          click_link 'Sign in'
        end

        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password

        click_button 'Log in'

        expect(current_path).to eq(posts_path)
      end
    end

    describe 'on unsuccessful sign in' do
      it 'should present warn with a flash' do
        within('.nav') do
          click_link 'Sign in'
        end

        click_button 'Log in'

        expect(current_path).to eq(new_user_session_path)
        expect(page).to have_content('Invalid Email or password.')
      end
    end
  end

  describe 'when signing out' do
    before(:each) do
      login_as @user
      visit root_path
    end

    after(:each) { Warden.test_reset! }

    it 'should redirect to the root path' do
      within('.nav') do
        click_link 'Sign out'
      end

      expect(current_path).to eq(root_path)
    end

    it 'should show Sign in buttons' do
      within('.nav') do
        click_link 'Sign out'
      end

      expect(page).to have_content('Sign in')
    end
  end

end
