require 'pry'
class FirearmsController < ApplicationController

  # GET: /firearms
  get "/firearms" do
    @user = current_user
    if @user.firearms.count == 0
      redirect 'firearms/new'
    else
      @firearms = @user.firearms.all
      erb :"/firearms/index"
    end
  end

  # GET: /firearms/new
  get "/firearms/new" do
    erb :"/firearms/new"
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
    erb :"/firearms/show"
  end

  # GET: /firearms/5/edit
  get "/firearms/:id/edit" do
    erb :"/firearms/edit"
  end

  # PATCH: /firearms/5
  patch "/firearms/:id" do
    redirect "/firearms/:id"
  end

  # DELETE: /firearms/5/delete
  delete "/firearms/:id/delete" do
    redirect "/firearms"
  end
end
