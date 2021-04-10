FactoryBot.define do
  factory :product do
    product_name     { 'test' }
    description      { 'testtesttest' }
    category_id      { 2 }
    detail_id        { 2 }
    delivery_fee_id  { 2 }
    area_id          { 2 }
    duration_id      { 2 }
    price            { 1000 }

    association      :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
