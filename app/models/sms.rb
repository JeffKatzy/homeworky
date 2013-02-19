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

class Sms < ActiveRecord::Base
  attr_accessible :content_received, :incoming_number

  @account_sid = 'ACc59c478180144c19b6029ec595f0719f'
  @auth_token = '2273acfc6ba1c74c14e7e43d3eebe971'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  @account = @client.account

  def respond recipient
    if content_received == "go"
      attempt_session(recipient)
    elsif content_received == "sorry"
      Text.send_text_to recipient, "Thanks for letting us know, we'll find someone else."
      notify_admin_of_the_cancellation_by recipient
    elsif content_received == "play"
        Call.audio_lesson_to recipient
    elsif content_received.to_i != 0
      set_new_page recipient
    else
      send_error_text_to recipient
    end
  end

  def find_user_from_number
    if Student.find_by_cell_number(self.incoming_number)
      Student.find_by_cell_number(self.incoming_number)
    elsif Teacher.find_by_cell_number(self.incoming_number)
      Teacher.find_by_cell_number(self.incoming_number)
    else
      Student.register(self)
    end
  end
end
