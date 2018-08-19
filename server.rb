require "sinatra"
require "faker"
require "sinatra/activerecord"
enable :sessions


set :database, "sqlite3:project5.sqlite3"

get '/' do
  redirect "/login"
end

get '/login' do
erb :login
end

post '/login' do
email = params[:email]
given_password = params[:password]
# p email
# p password
#check to see if email (or username) exists and check to see if the email has a password that matches the form password. if they match, log in the user.
user = User.find_by(email: email) #you have to specifiy that all emails must be unique.
if user == nil
  redirect "/login"
else
if user.password == given_password
session[:user] = user
redirect "/personal"
else
  p "Invalid Credentials"
  redirect "/login"
end
end
end

get '/logout' do
  session[:user] = nil
  redirect '/login'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  p params
  user = User.new(
    email: params["email"],
    name: params["name"],
    password: params["password"]
  )
  user.save
  redirect "/personal"
end



get '/personal' do
  # @user = User.find(params[:id])
    erb :personal
end

get '/feed' do
  @posts = Post.all
  erb :feed
end

post '/feed' do
  post = Post.create(
    post_title: params["title"],
    description: params["content"],
    image_url: params["imgurl"],
    # belongs_to: session[:user]
  )
  url = "/feed"
  redirect url
end

# post '/allusers' do
#   user = User.create(
#     first_name: params["first_name"],
#     last_name: params["last_name"],
#     email: params["email"],
#     birthdate: params["birthdate"],
#     profile_num: SecureRandom.urlsafe_base64
#   )
#   url = "/personal/" + user.id.to_s
#   redirect url
# end


get '/allusers' do
  @users = User.all
  erb :allusers
end

require "./models"
