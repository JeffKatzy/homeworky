class AddCallSidToSms < ActiveRecord::Migration
  def change
    add_column :sms, :call_sid, :string
  end
end
