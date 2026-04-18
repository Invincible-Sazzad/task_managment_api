FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2026-04-18 11:29:27" }
  end
end
