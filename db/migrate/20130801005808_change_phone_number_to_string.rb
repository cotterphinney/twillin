class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|  
	  t.change :twilio_phone, :string 
	end
  end
end
