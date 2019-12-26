# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food, type: :model do
  describe '.build_from_params' do
    subject { described_class.build_from_params(food_params, point_ids) }

    let(:food_params) do
      { name: 'name', description: 'description', image: image }
    end
    let(:image) do
      fixture_file_upload(
        Rails.root.join('spec', 'fixtures', 'cabbage.jpg'), 'image/jpeg'
      )
    end
    let(:points) { create_list(:point, 2) }
    let(:point_ids) { points.pluck(:id) }

    it 'Food が 引数 food_params の値で作成される' do
      expect(subject.name).to eq food_params[:name]
      expect(subject.description).to eq food_params[:description]

      expect(subject.image).to be_attached
      expect(subject.image.filename).to eq image.original_filename
    end

    it 'Food.points が 引数 point_ids の値で関連付けされる' do
      expect(subject.points).to match_array points
    end

    it 'Food は未登録' do
      expect { subject }.not_to change(Food, :count)
    end
  end
end
