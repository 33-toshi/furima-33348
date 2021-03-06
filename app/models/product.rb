class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 ,message: 'は300円〜9,999,999円で入力してください' }, format: { with: /\A[0-9]+\z/  }, numericality: true
    validates :image
  end
  with_options numericality: { other_than: 1 , message:'を選択してください' }do
    validates :category_id
    validates :detail_id
    validates :delivery_fee_id
    validates :area_id
    validates :duration_id
  end

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :detail
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :duration
  has_many :orders
end
