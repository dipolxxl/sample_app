FactoryGirl.define do
  sequence :email do |n|
    "person-#{n}@example.com"
  end

  factory :user do
    name                  "Michael Hartl"
    email
    password              "foobar"
    password_confirmation "foobar"
  end
end

FactoryGirl.define do
  factory :micropost do
    content "Foo bar"
    association :user
  end
end