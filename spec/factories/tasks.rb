FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    status { 1 }
    due_date { "2026-04-17 15:02:48" }
    completed_at { "2026-04-17 15:02:48" }
  end
end
