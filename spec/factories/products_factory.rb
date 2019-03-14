FactoryBot.define do
  sequence(:name) { |n| "#{n}" }

  factory :product do
    name
    description {"Smells fruity."}
    scents {"Lemon"}
    price {"2.00"}
  end
end
