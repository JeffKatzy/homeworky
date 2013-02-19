# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  name       :string(255)
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classroom < ActiveRecord::Base
  attr_accessible :name, :number
  before_create :assign_unique_number
  belongs_to :teacher

  has_many :designations
  has_many :students, through: :designations

  has_many :assignments
  has_many :lessons, through: :assignments

  def self.numbers
    Classroom.all.collect{ |classroom| classroom.number }
  end

  def number_repeat?
    Classroom.numbers.include?(number)
  end

  def reassign_if_repeat
    if number_repeat?
      number = rand(999)
    end
  end

  def assign_unique_number
    number = rand(999)
    reassign_if_repeat
    reassign_if_repeat #FIX THIS - should be able to
    #implement with a WHILE loop in the reassign if repeat function
  end

  def assign_lesson(lesson)
    assignments << lesson
  end
end
