FactoryBot.define do
  factory :event do
    eventname { "MyString" }
    contents { "MyText" }
    term { "2022-11-09" }
    image { nil }
  end
end
