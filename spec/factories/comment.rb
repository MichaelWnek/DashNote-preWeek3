FactoryGirl.define do
  factory :comment do
    body 'This is the body'
    post
    author
  end
end
