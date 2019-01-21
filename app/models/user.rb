class User < ApplicationRecord
    has_many :favorites
    has_many :foods, through: :favorites, :dependent => :destroy

    validates :name, presence: true
end
