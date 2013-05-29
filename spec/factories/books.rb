# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    name "MyString"
    cover_url "MyString"
    notes "MyText"
    genre "MyString"
    user_id ""
  end
end
