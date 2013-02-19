# == Schema Information
#
# Table name: sms
#
#  id               :integer          not null, primary key
#  incoming_number  :string(255)
#  content_received :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  call_sid         :string(255)
#

require 'test_helper'

class SmsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
