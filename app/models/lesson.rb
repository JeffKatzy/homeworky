# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  teacher_id  :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lesson < ActiveRecord::Base
  attr_accessible :answer, :question, :teacher_id

  has_many :classrooms, through: :assignments
end
