# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pattern do
    content "MyString"
    guess_state "MyString"
  end
end
