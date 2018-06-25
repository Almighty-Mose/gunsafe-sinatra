require 'pry'
class FirearmsController < ApplicationController

  # GET: /firearms
  get "/firearms" do
    if logged_in?
      @user = current_user
      if @user.firearms.count == 0
        redirect 'firearms/new'
      else
        @firearms = @user.firearms.all
        erb :"/firearms/index"
      end
    else
      redirect '/login'
    end
  end

  # GET: /firearms/new
  get "/firearms/new" do
    if logged_in?
      erb :"/firearms/new"
    else
      redirect '/login'
    end
  end

  # POST: /firearms
  post "/firearms" do
    if !params[:firearm].empty?
      @firearm = Firearm.new(params[:firearm])
      @firearm.user_id = current_user.id
      @firearm.save
    end
    if params[:commit] == "Add Another"
      redirect '/firearms/new'
    else
      redirect "/firearms"
    end
  end

  # GET: /firearms/5
  get "/firearms/:id" do
    if logged_in?
      @firearm = Firearm.find_by_id(params[:id])
      erb :"/firearms/show"
    else
      redirect '/login'
    end
  end

  # GET: /firearms/5/edit
  get "/firearms/:id/edit" do
    if logged_in?
      @firearm = Firearm.find_by_id(params[:id])
      erb :"/firearms/edit"
    else
      redirect '/login'
    end
  end

  # PATCH: /firearms/5
  patch "/firearms/:id" do
    redirect "/firearms/:id"
  end

  # DELETE: /firearms/5/delete
  delete "/firearms/:id/delete" do
    @firearm = Firearm.find_by_id(params[:id])
    if logged_in? && current_user.id == @firearm.user_id
      @firearm.delete
      redirect '/firearms'
    else
      redirect '/firearms'
    end
  end
end
