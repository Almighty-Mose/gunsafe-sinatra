require 'pry'
class UsersController < ApplicationController

  #shows a User's homepage
  get '/users/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'users/show'
    else
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
      @user = User.create(params)
      session[:user_id] = @user.id
    else
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

