class CallsController < ApplicationController

  BASE_URL = 'http://twillin-22618.usw1.actionbox.io:3000'

  before_filter :authenticate_user!, :except => [ :patch_calls, :patch_calls_muted]

  def new
  end

  def make_call

    account_sid = current_user.twilio_sid
    account_token = current_user.twilio_token
    account_phone = current_user.twilio_phone

    unless (params[:numbers][:muted].values.length > 1) && (params[:numbers][:nonmuted].values.length > 2)
      redirect_to action: 'new'
      flash[:notice] = "You must fill all inputs with valid phone numbers."
      return
    end

    from_number = account_phone
    your_number = params[:your_number]
    first_number = params[:first_number]
    second_number = params[:second_number]

    muted_numbers = params[:numbers][:muted].values
    numbers = params[:numbers][:nonmuted].values

    client = Twilio::REST::Client.new(account_sid, account_token)
 
    numbers.each do |number|
      client.account.calls.create(
        :from => "+1#{from_number}",
        :to => "+1#{number}",
        :url => BASE_URL + "/patch_calls"
        )
    end

    muted_numbers.each do |number|
      client.account.calls.create(
        :from => "+1#{from_number}",
        :to => "+1#{number}",
        :url => BASE_URL + "/patch_calls_muted"
        )
    end
 
    render :action => "patch_calls_muted.xml.builder"
  end

  def patch_calls
    render :action => "patch_calls.xml.builder", :layout => false
  end

  def patch_calls_muted
    render :action => "patch_calls_muted.xml.builder", :layout => false
  end

end
