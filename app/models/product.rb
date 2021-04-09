class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :detail_id
      validates :delivery_fee_id
      validates :area_id
      validates :duration_id
    end
    validates :price, inclusion: { in: 300..9_999_999 }, format: {with: /\A[0-9]+\z/ }, numericality: true
    validates :image
  end
  
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :detail
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :duration
end
