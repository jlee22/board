
get '/messages/new' do
  @contacts = current_user.contacts
  @source = Resource.all
  erb :'messages/new'
end


post '/messages' do

  @contact = User.find(params[:id])
  @source = Resource.find(params[:api_id])

  @client = Twilio::REST::Client.new account_sid, auth_token
  resp = Net::HTTP.get_response(URI.parse(@source.link))

  account_sid = ENV['TWILLIO_SID']
  auth_token = ENV['TWILLIO_AUTH_TOKEN']


  if params[:custom_text].length > 0
  @text = params[:custom_text]
  @client.account.messages.create({
    :from => '+1 408-872-9724',
    :to => @contact.phonenumber,
    :body => @text,
  end

end
