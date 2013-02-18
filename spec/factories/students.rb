# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    name {Faker::Name.name}
    cell_number  {Faker::PhoneNumber.phone_number}

    after(:build) do |student|
      [:math_class, :english_class, :science_class].each do |student|
        classroom.students << FactoryGirl.build(:classroom, student: student)
      end
    end

    factory :student_one do
      name {Faker::Name.name}
      cell_number  {Faker::PhoneNumber.phone_number}
    end

    factory :student_two do
      name {Faker::Name.name}
      cell_number  {Faker::PhoneNumber.phone_number}
    end

    factory :student_three do
      name {Faker::Name.name}
      cell_number  {Faker::PhoneNumber.phone_number}
    end
  end
end
