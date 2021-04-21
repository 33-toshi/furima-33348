class ProductOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id ,numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user.id, product_id: product.id )
    Address.create(postal_code: postal_code, area_id: area.id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end

end
