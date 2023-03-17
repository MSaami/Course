FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :course do
    name {Faker::Name.name}
    author factory: :user

    trait :with_learning_path do
      order_in_learning_path {rand(1..30)}
      learning_path
    end
  end

  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
  end


  factory :learning_path do
    name {Faker::ProgrammingLanguage.name}
  end
end
