class Sms < ActiveRecord::Base
  attr_accessible :content_received, :incoming_number

  @account_sid = 'ACc59c478180144c19b6029ec595f0719f'
  @auth_token = '2273acfc6ba1c74c14e7e43d3eebe971'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  @account = @client.account
end
