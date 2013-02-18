# == Schema Information
#
# Table name: students
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cell_number :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :cell_number, :name
  validates :cell_number, presence: true, uniqueness: true

  has_many :classrooms, through: :designations
end
