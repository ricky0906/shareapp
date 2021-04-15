FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 2) }
    first_name              { Faker::Name.first_name }
    last_name               { Faker::Name.last_name }
    email                   { Faker::Internet.free_email }
    password                { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation   { password }
  end
end
