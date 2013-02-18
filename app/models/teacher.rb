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

class Teacher < ActiveRecord::Base
  attr_accessible :email, :name, :password_confirmation, :password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false}
  validates :name, presence: true, length: { maximum: 50}
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true

  has_secure_password
  before_save { email.downcase! }

  has_many :classrooms
end
