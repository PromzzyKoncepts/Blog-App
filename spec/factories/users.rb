FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }

    trait :with_bio do
      bio { Faker::Lorem.sentences.join(' ') }
    end

    trait :with_photo do
      photo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpg'), 'image/jpeg') }
    end

    trait :with_posts do
      transient do
        posts_count { 5 }
      end
      
      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, author: user)
      end
    end

    factory :user_with_bio, traits: [:with_bio]
    factory :user_with_photo, traits: [:with_photo]
    factory :user_with_posts, traits: [:with_posts]

  end
end
