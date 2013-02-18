# == Schema Information
#
# Table name: designations
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  student_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Designation < ActiveRecord::Base
  belongs_to :student
  belongs_to :classroom
end
