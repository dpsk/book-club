# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    name "MyString"
    cover_url "http://images.google.com/image.jpg"
    notes "MyText"
    genre "MyString"
    author "author"
    user_id "1"
  end
end
