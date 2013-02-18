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

require 'spec_helper'

describe Student do
  before do
    @student = create(:student)
  end

  subject { @student }

  it { should respond_to(:name)}
  it { should respond_to(:cell_number)}
  it { should respond_to(:classrooms)}
  it { should respond_to(:relationships)}

  it "has a valid factory" do
    expect(create(:student)).to be_valid
  end

  describe "when number is not present" do
    before { @student.cell_number = " " }
      it { should_not be_valid }
  end

  describe "classrooms method" do
    it "should have the right number of classrooms" do
      @student.classrooms.count.should == 3
    end
  end
end
