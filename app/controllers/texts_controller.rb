class TextsController < ApplicationController

  # your Twilio authentication credentials
  ACCOUNT_SID = 'ACfc93658ca7686387e14b7ebe65b2c5ea'
  ACCOUNT_TOKEN = '9831d388ae82dd36f31945db50871d28'
  ACCOUNT_PHONE = '3104399320'

  before_filter :authenticate_user!

  def index
  end

  def new
  end

  def send_text
    number_to_send_to = params[:number_to_send_to]
    text_body = params[:text_body]

    @twilio_client = Twilio::REST::Client.new ACCOUNT_SID, ACCOUNT_TOKEN
 
    if @twilio_client.account.sms.messages.create(
      :from => "+1#{ACCOUNT_PHONE}",
      :to => number_to_send_to,
      :body => text_body
    )
      redirect_to action: 'index'
      flash.alert = "you sent the text '#{text_body}' to #{number_to_send_to}"
    else
      redirect_to action: 'index'
      flash.alert = "your text could not be sent"
    end
  end

  def create
  end

end
