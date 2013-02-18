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

require 'spec_helper'

describe Designation do
  let(:student){FactoryGirl.create(:student)}
  let(:classroom){FactoryGirl.create(:classroom)}
  let(:designation){ student.designations.build(classroom_id: classroom.id)}

  subject { designation }

  it { should be_valid }
end
