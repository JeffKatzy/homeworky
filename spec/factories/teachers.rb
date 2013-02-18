# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    name {Faker::Name.name}
    email { Faker::Internet.email}
    password "foobar"
    password_confirmation "foobar"

    after(:build) do |teacher|
      [:math_class, :english_class, :science_class].each do |classroom|
        teacher.classrooms << FactoryGirl.build(:classroom, teacher: teacher)
      end
    end

    factory :invalid_teacher do
      email nil
    end
  end
end
