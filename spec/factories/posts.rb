FactoryBot.define do
  factory :post do
    nickname { "MyString" }
    images { nil }
    titles { "MyString" }
    comments { "MyString" }
    isSafe { false }
  end
end
