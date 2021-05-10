class ProductOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :user_id, :product_id,:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は-(ハイフン)をいれて入力してください' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ , message: 'は-(ハイフン)なし、半角数字10桁もしくは11桁で入力してください'}
    validates :token
    validates :user_id
    validates :product_id
  end
  validates :area_id, numericality: { other_than: 1 , message: 'を選択してください'}

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,building_name: building_name, phone_number: phone_number, order: order)
  end
end
