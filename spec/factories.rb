# frozen_string_literal: true

FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :learning_path_enrollment do
    talent factory: :user
    learning_path
    next_course_id { learning_path.courses.first.id }
  end

  factory :course do
    name { Faker::Name.name }
    author factory: :user

    trait :with_learning_path do
      order_in_learning_path { rand(1..30) }
      learning_path
    end
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :learning_path do
    name { Faker::ProgrammingLanguage.name }
    after(:create) do |path|
      create_list(:course, 4, :with_learning_path, learning_path: path)
    end
  end
end
