FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { 40.0 }
    description { "MyString" }
    image { "https://picsum.photos/200" }
  end
end
