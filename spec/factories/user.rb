FactoryGirl.define do
  factory :user, aliases: [:author] do
    first_name 'Jean Luc'
    last_name  'Picard'
    sequence(:email, 100) { |n| "jlpicard#{n}@starfleet.gov" }
    password 'earlgrey'
    password_confirmation 'earlgrey'
  end
end
