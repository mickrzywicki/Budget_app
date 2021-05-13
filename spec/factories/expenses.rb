FactoryBot.define do
  factory :expense do
    name { 'Tomato' }
    price { 2.75 }
    paid_on { Date.today }
  end
end

