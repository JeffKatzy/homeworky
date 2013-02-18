# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe Teacher do
  before do
      @teacher = create(:teacher)
  end

  subject { @teacher }

  it { should respond_to(:name)}
  it { should respond_to(:email)}
  it { should respond_to(:password_digest)}
  it { should respond_to(:authenticate)}

  it "has three classrooms" do
    expect(create(:teacher).classrooms.count).to eq 3
  end

  it "has a valid factory" do
    expect(create(:teacher)).to be_valid
  end

  describe "when email is not present" do
    before { @teacher.email = " "}
      it { should_not be_valid}
  end

  describe "when name is too long" do
    before { @teacher.name = "a"*51}
    it { should_not be_valid}
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        @teacher.email = invalid_address
        @teacher.should_not be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_one = create(:teacher)
      user_one.email = "jeff@gmail.com"
      user_one.save
      user_two = user_one
      user_two.save
    end

      it { should_not be_valid}
  end

  describe "email address with mixed case" do
    let(:mixed_case_email){ "Foo@exAMple.com"}
    it "should be saved as all lower case" do
      @teacher.email = mixed_case_email
      @teacher.save
      @teacher.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "when password is not present" do
     before {@teacher.password = @teacher.password_confirmation = " "}
     it {should_not be_valid}
   end

  describe "when password doesn't match confirmation" do
    before { @teacher.password_confirmation = "mismatch" }
    it {should_not be_valid}
  end

  describe "when password confirmation is nil" do
    before {@teacher.password_confirmation = nil}
    it { should_not be_valid}
  end

  describe "with a password confirmation is too short" do
    before {@teacher.password = @teacher.password_confirmation = 'a'*5}
    it { should_not be_valid}
  end

  describe "return value of authenticate method" do
    before { @teacher.save}
    let(:found_user){ Teacher.find_by_email(@teacher.email)}

    describe "with valid password" do
      it { should == found_user.authenticate(@teacher.password)}
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid")}
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false}
    end
  end
end
