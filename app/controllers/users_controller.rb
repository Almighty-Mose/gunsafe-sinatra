require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  #shows a User's homepage
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in? && current_user.id == @user.id
      erb :'users/show'
    elsif logged_in? && current_user != @user.id
      flash[:message] = "You Do Not Have Permission to View This User"
      redirect '/firearms'
    else
      flash[:message] = "Please Log In To Continue"
      redirect '/login'
    end
  end

  #checks for existing user, then signs up new user
  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/firearms'
    end
  end

  #redirects already logged in user to firearms list, or shows login page
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/firearms'
    end
  end

  #takes info from signup.erb, creates a new User instance and persists to database, logs in new user
  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      if User.find_by(username: params[:username]) == nil
        @user = User.create(params)
        session[:user_id] = @user.id
      else
        flash[:message] = "A User Already Exists With That Name"
        redirect'/signup'
      end
    else
      flash[:message] = "All Fields are Required"
      redirect '/signup'
    end
    redirect '/firearms'
  end

  #takes the info from login.erb, authenticates and logs in
  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user != nil && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/firearms'
    else
      flash[:message] = "Incorrect Username or Password"
      redirect '/login'
    end
  end

  #logs out a user by destroying session hash
  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end
end

