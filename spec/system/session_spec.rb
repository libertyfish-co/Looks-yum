# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OmniAuth login/logout', type: :system do
  before do
    Rails.application.env_config['omniauth.auth'] = facebook_mock('tester')
  end

  describe 'Omniauthログイン/ログアウト' do
    it 'facebookログイン' do
      visit '/auth/facebook'

      expect(page).to have_content 'tester'
      expect(page).to have_content 'My Favorites'
      expect(page).to have_content 'New Knowledge'
      expect(page).to have_content 'logout'
    end

    it 'facebookログアウト' do
      visit '/auth/facebook'

      click_on 'logout'
      find('img.facebook-lg')
    end
  end
end
