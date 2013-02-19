class StudentAnswer < ActiveRecord::Base
  attr_accessible :correct, :question_id, :student_id, :value
end
