class FirearmsController < ApplicationController

  # GET: /firearms
  get "/firearms" do
    erb :"/firearms/index.html"
  end

  # GET: /firearms/new
  get "/firearms/new" do
    erb :"/firearms/new.html"
  end

  # POST: /firearms
  post "/firearms" do
    redirect "/firearms"
  end

  # GET: /firearms/5
  get "/firearms/:id" do
    erb :"/firearms/show.html"
  end

  # GET: /firearms/5/edit
  get "/firearms/:id/edit" do
    erb :"/firearms/edit.html"
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
