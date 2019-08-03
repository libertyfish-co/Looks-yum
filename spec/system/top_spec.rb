# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TopPage', type: :system do
  before do
    Rails.application.env_config['omniauth.auth'] = facebook_mock('tester')
  end

  context '野菜が検索できること' do
    before do
      @food = Food.create(name: 'テスト野菜', description: 'テスト野菜の説明')
      @food.image.attach(
        io: File.open('spec/fixtures/cabbage.jpg'),
        filename: 'cabbage.jpg'
      )
    end

    it 'top/index' do
      visit root_path
      fill_in 'q[name_cont]', with: 'テスト'
      click_button('Search')

      expect(page).to have_content 'テスト野菜'
    end
  end
end
