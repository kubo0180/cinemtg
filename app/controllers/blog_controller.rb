class BlogController < ApplicationController
  def index
    @user = User.find(params[:id])
    @entries = Entry.where("user_id=?", @user.id).public_entries.latest
  end

  def show
    @user = User.find(params[:id])
    @entry = Entry.find(params[:entry_id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @entry }
    end
  end

end
