FactoryBot.define do
  factory :cart do
    name { 'MyString' }
    unit_price { 500 }
    quantity { 2 }
    price { 1000 }
    user_id { 0001 }
  end
end
