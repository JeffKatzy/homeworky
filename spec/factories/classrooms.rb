# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    name "Gym Class"
    number 999

    after(:build) do |classroom|
      [:student_one, :student_two, :student_three].each do |student|
        classroom.students << FactoryGirl.build(:classroom, student: student)
      end
    end

    factory :math_class do
      name "Math class"
      number 888
    end

    factory :math_repeat do
      name "Algebra"
      number 888
    end

    factory :english_class do
      name "English Class"
      number 777
    end

    factory :science_class do
      name "Science class"
      number 666
    end
  end
end
