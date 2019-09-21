# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  before do
    Rails.application.env_config['omniauth.auth'] = facebook_mock('tester')
    @food = Food.create(name: 'テスト野菜', description: 'テスト野菜の説明')
    @food.image.attach(io: File.open('spec/fixtures/cabbage.jpg'),
                       filename: 'cabbage.jpg')
  end

  context 'クリックでお気に入り登録/解除の切り替えが出来ること', js: true do
    it 'お気に入り登録/解除' do
      visit '/auth/facebook'
      visit foods_path
      find('div.favorite_part a.favorite').click
      find('div.favorite_part a.not_favorite').click
      find('div.favorite_part a.favorite')
    end
  end

  describe 'My Favoritesページの表示' do
    it 'お気に入り登録がない場合' do
      visit '/auth/facebook'
      click_on('My Favorites')
      expect(page).to have_content 'There is no favorites.'
    end
  end

  describe 'My Favoritesページの表示' do
    before do
      @user = User.create(name: 'tester')
      @user.foods << @food
    end

    it 'お気に入り登録がある場合' do
      visit '/auth/facebook'
      click_on('My Favorites')
      expect(page).to have_content 'テスト野菜'
    end
  end
end
