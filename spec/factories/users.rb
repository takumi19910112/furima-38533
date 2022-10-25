FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"1" + "a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_day             {Faker::Date.birthday}
    first_name            {"山坂"}
    last_name             {"巧"}
    read_first            {"タナカ"}
    read_last             {"タロウ"}

  end
end