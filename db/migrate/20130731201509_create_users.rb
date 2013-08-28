class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :twilio_sid
      t.string :twilio_token
      t.integer :twilio_phone

      t.timestamps
    end
  end
end
 