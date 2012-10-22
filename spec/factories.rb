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