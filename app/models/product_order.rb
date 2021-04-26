class ProductOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :user_id, :product_id, :order_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end
  validates :area_id, numericality: { other_than: 1 }

  def save
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, order_id: order_id)
    Order.create(user_id: user_id, product_id: product_id)
  end
end
