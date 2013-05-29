# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    book_id 1
    user_id 1
    score 1
  end
end
