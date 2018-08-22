require "sinatra"
require "faker"
require "sinatra/activerecord"
require "curb"
enable :sessions


# require "active_record"
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
# set :database, "sqlite3:project5.sqlite3"
# THIS IS A HEROKU SPECIFIC ERROR. you have to remember this somehow. or at least reference back to it.

get '/' do
  redirect "/login"
end

get '/login' do
erb :login
end

get '/siteinfo' do
erb :siteinfo
end

get '/supernews' do
  @web_search = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search/?q=super+hero&location.address=new+york&token=F33FG3NCO5EPWSKXWJXF")
  @look_through = @web_search.body_str
  @data = JSON.parse(@look_through)
  @events = @data["events"]
  erb :supernews
end

post '/login' do
email = params[:email]
given_password = params[:log_in_password]
# p email
# p password
#check to see if email (or username) exists and check to see if the email has a password that matches the form password. if they match, log in the user.
user = User.find_by(email: email) #you have to specifiy that all emails must be unique.
if user == nil
  redirect "/login"
else
if user.password == given_password
session[:user] = user
# redirect '/personal'
url = "/personal/" + user.id.to_s
redirect url
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
    first_name: params["first_name"],
    last_name: params["last_name"],
    user_name: params["user_name"],
    password: params["password"],
    birthdate: params["birthdate"],
    image_url: "/default_logo.png",
    description: "Add a description through the settings!"
  )
  user.save
  redirect "/login"

  # rescue ActiveRecord::RecordNotUnique
  # p "Username Or Email Not Unique"
  # redirect "/signup"

end


get '/personal' do
  erb :personal
end

get '/personal/:id' do
  @personal = User.find(params[:id])
  erb :personal
end

get '/settings' do
    @current_user = User.find(session[:user].id)
  erb :settings
end

put '/settings/:id' do
  @current_user = User.find(session[:user].id)
  @current_user.image_url = params["image"]
  @current_user.user_name = params["user_name"]
  @current_user.description = params["description"]
  @current_user.save
  p "Changes Saved"
  redirect to "/personal/#{@current_user.id}"
end



get '/deleteaccount' do
  current_user = User.find(session[:user].id)
  current_user.destroy
  p "Current User Deleted"
  redirect "/logout"
end

get '/deletepost/:id' do
  current_post = Post.find(params[:id])
  current_post.destroy
  p "Post Deleted"
  redirect "/personal"
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
    owner: session[:user].user_name
  )
  url = "/feed"
  redirect url
end

get '/personalposts' do
  @myposts = Post.select {
    |x| x.owner == session[:user].user_name
  }
  erb :personalposts
end

post '/postsearch' do
  @username = params["usersearch"]
  @userposts = Post.select {
    |x| x.owner == "#{@username}"
  }
  erb :postsearch
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

get '/passcode' do
 erb :passcode
end

require "./models"
