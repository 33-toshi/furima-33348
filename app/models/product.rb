class Product < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :description
    validates :category_id
    validates :detail_id
    validates :delivery_fee_id
    validates :area_id
    validates :duration_id
    validates :price
    validates :image
  end

  belongs_to :user
end
