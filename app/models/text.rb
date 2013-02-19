# == Schema Information
#
# Table name: texts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Text < ActiveRecord::Base
  def self.send_text_to cell_number, body
      @account_sid = 'ACc59c478180144c19b6029ec595f0719f'
      @auth_token =  '2273acfc6ba1c74c14e7e43d3eebe971'
      @client = Twilio::REST::Client.new(@account_sid, @auth_token)
      @account = @client.account
      @message = @account.sms.messages.
        create({:from => '+12673172085', :to => cell_number, :body =>
            body})    #send the message
      puts @message
  end
end
