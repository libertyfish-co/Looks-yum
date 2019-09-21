# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'validation test', type: :system do
  context '野菜登録時バリデーションエラーメッセージが表示されること' do
    describe 'name入力フォーム' do
      it '空の場合' do
        visit 'foods/new'
        click_on 'submit'

        expect(page).to have_content %(Name can't be blank)
      end

      it '11文字以上の場合' do
        text = ''
        11.times do
          text += 'a'
        end
        visit 'foods/new'
        fill_in 'food[name]', with: text
        click_on 'submit'

        expect(page).to have_content(
          'Name is too long (maximum is 10 characters)'
        )
      end
    end

    describe 'point選択時', js: true do
      it '何も選択しなかった場合' do
        visit 'foods/new'
        click_on 'submit'

        expect(page).to have_content 'Point select please.'
      end

      it '4つ目を選択した場合' do
        9.times do |mun|
          Point.create(point: "point_#{mun + 1}")
        end

        visit 'foods/new'
        find('div.row div.point_list:nth-child(1)').click
        find('div.row div.point_list:nth-child(2)').click
        find('div.row div.point_list:nth-child(3)').click
        find('div.row div.point_list:nth-child(4)').click
        text = page.driver.browser.switch_to.alert.text
        expect(text).to eq '登録出来るポイントは３つまでです'
      end
    end

    describe 'description入力フォーム' do
      it '空の場合' do
        visit 'foods/new'
        click_on 'submit'

        expect(page).to have_content %(Description can't be blank)
      end

      it '301文字以上の場合' do
        text = ''
        301.times do
          text += 'a'
        end
        visit 'foods/new'
        fill_in 'food[description]', with: text
        click_on 'submit'

        expect(page).to have_content(
          'Description is too long (maximum is 300 characters)'
        )
      end
    end

    describe 'image選択フォーム' do
      it '何も選択しなかった場合' do
        visit 'foods/new'
        click_on 'submit'

        expect(page).to have_content %w(Image can't be blank)
      end
    end
  end
end
