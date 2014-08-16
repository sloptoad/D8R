FactoryGirl.define do

  factory :user do
    sequence(:username) do |n|
      "Umba#{n}"
    end
    password "password"
    img "url"
    age 20
    gender 'female'
    bio 'Hello'
  end

  factory :activity_type do
    sequence(:name) do |n|
      "ActivityType#{n}"
    end
  end

  factory :activity do
    activity_type
    sequence(:description) do |n|
      "Description#{n}"
    end
    location "Here."
    img "url"
  end

  factory :preference do
    user
    gender_pref 'male'
    min_age 27
    max_age 35
    activity_type
  end

end