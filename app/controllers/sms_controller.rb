class SmsController < ApplicationController
  def new
  end

  def create
    @sms = Sms.create(incoming_number: params['From'].to_s,
      content_received: params['Body'].downcase, call_sid: params['CallSid'].to_s)
    @sms.save
    @user = @sms.find_user_from_number
    @sms.respond @user
  end
end
