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

require 'spec_helper'

describe Classroom do
  before do
    @classroom = create(:classroom)
  end

  subject { @classroom }

  it { should respond_to(:teacher)}
  it { should respond_to(:name)}
  it { should respond_to(:number)}
  it { should respond_to(:relationships)}

  describe "numbers method" do
    it "collects a list of all classroom numbers" do
      create(:math_class)
      create(:english_class)
      create(:science_class)
      (Classroom.numbers & [888, 777, 666]).any?
    end
  end

  describe "number_repeat?" do
    it "returns true if repeat" do
      classroom_one = create(:math_class)
      classroom_two = create(:math_repeat)
      classroom_two.number_repeat?.should == true
    end

    it "returns false for non-repeat" do
      classroom_one = create(:math_class)
      classroom_two = create(:science_class)
      classroom_two.number = 789
      classroom_two.number_repeat?.should == false
    end
  end

  describe "reassign if repeat" do
    it "reassigns if repeat" do
      classroom_one = create(:math_class)
      classroom_two = create(:math_repeat)
      classroom_two.reassign_if_repeat
      classroom_two.number.should_not == 888
    end

    it "does not reassign if no repeat" do
      classroom_one = create(:math_class)
      classroom_two = create(:science_class)
      classroom_two.number = 444
      classroom_two.reassign_if_repeat
      classroom_two.number.should == 444
    end
  end

  describe "students method" do
    it "should return the right number of students" do
      @classroom.students.count.should == 3
    end
  end
end
