FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + Faker::Number.number.to_s }
    password_confirmation { password }
    sei              { '山田' }
    mei              { 'たろう' }
    sei_kana              { 'ヤマダ' }
    mei_kana              { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
