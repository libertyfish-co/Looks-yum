require 'rails_helper'

RSpec.describe 'NewKonwledge', type: :system do
  before do
    9.times do |mun|
      Point.create(point: "point_#{mun + 1}")
    end
    Rails.application.env_config['omniauth.auth'] = facebook_mock('tester')
  end

  context '野菜の登録ができること' do
    describe '登録ページ表示' do
      it 'foods/new' do
        visit 'auth/facebook'
        click_on 'New Knowledge'

        expect(page).to have_content 'catch phrase'
        expect(page).to have_content 'points'
        expect(page).to have_content 'note'
        expect(page).to have_content 'image'
        expect(page).to have_button 'submit'
      end
    end

    describe 'submit test', js: true do
      it 'foods/new' do
        visit 'auth/facebook'
        click_on 'New Knowledge'
        fill_in 'food[name]', with: 'テスト野菜'
        find('div.row div.point_list:nth-child(1)').click
        find('div.row div.point_list:nth-child(2)').click
        find('div.row div.point_list:nth-child(3)').click
        fill_in 'food[description]', with: 'テスト野菜の説明'
        attach_file 'food[image]', "#{Rails.root}/spec/fixtures/cabbage.jpg"
        click_on 'submit'
        text = page.driver.browser.switch_to.alert.text
        expect(text).to eq 'テスト野菜を登録しました'
        page.accept_alert
        expect(page).to have_content 'テスト野菜'
        find('.fa-star')
        expect(page).to have_content '美味しいテスト野菜の選び方!!'
        expect(page).to have_content 'point_1'
        expect(page).to have_content 'point_2'
        expect(page).to have_content 'point_3'
        expect(page).to have_content 'テスト野菜の説明'
        expect(page).to have_css('img[src$="cabbage.jpg"]')
      end
    end
  end
end
