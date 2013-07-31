enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/test' do
  # 
end

post '/login' do
  # get authorization
  # key = "" #substitute your keys
  # secret = ""

  # consumer = OAuth::Consumer.new(key, secret, {:site => "http://github.com"})
  # request_token = consumer.get_request_token
  # client = Octokit::Client.new(:login => params[:username], :oauth_token => "oauth2token")
  # p request_token.authorize_url

  #user needs to go to this url and approve it
  # access_token = request_token.get_access_token
end

get '/user/:username' do
  begin
    if Octokit.user params[:username]
      @user = Octokit.user params[:username]
      erb :username
    end
  rescue
    @message = "No such user."
    erb :index
  end
end

post '/user' do
  redirect "/user/#{params[:get_username]}"
end
