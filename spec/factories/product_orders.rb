FactoryBot.define do
  factory :product_order do
    postal_code      { '123-4567' }
    area_id          { 2 }
    city             { '京都' }
    house_number     { '1-1' }
    building_name    { '嵯峨ハイツ' } 
    phone_number     { '09012345678' }
  end
end
