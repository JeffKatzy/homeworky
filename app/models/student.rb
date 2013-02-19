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
  validates :cell_number, presence: true
  has_many :designations
  has_many :classrooms, through: :designations

  def self.register(sms)
    code = sms.content_received.split[0].to_i
    name = sms.content_received.split[1]
    if code == 0
      Text.send_text_to(sms.incoming_number, "Please enter your classroom code followed by your name")
    elsif Classroom.find_by_number(code) == nil
      Text.send_text_to(sms.incoming_number, "Could not find classroom with that code.  Please try again.")
    elsif Classroom.find_by_number(code).present?
      student = Student.create({name: name, cell_number: sms.incoming_number})
      student.save
      student.classrooms << Classroom.find_by_number(code)
      Text.send_text_to(sms.incoming_number, "Great you are now registered for your class")
    end
  end
end
