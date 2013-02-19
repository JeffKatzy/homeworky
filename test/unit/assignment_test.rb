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

require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
