# == Schema Information
#
# Table name: assignments
#
#  id           :integer          not null, primary key
#  lesson_id    :integer
#  classroom_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Assignment < ActiveRecord::Base
  attr_accessible :classroom_id, :lesson_id

  belongs_to :classroom
  belongs_to :assignment
end
