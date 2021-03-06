require 'babosa'

# represents categories of products
class Category < ApplicationRecord
    extend FriendlyId

    mount_uploader :image, GroupsUploader

    friendly_id :name, use: :slugged

    has_many :products, dependent: :destroy

    validates :name, presence: true, uniqueness: true

    def normalize_friendly_id(input)
        input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end
end
