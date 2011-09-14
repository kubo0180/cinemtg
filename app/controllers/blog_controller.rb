class BlogController < ApplicationController
  def index
    @blogger = Blogger.find(params[:id])
    @entries = Entry.where("blogger_id=?", @blogger.id).public_entries.latest
  end

  def show
    @blogger = Blogger.find(params[:id])
    @entry = Entry.find(params[:entry_id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @entry }
    end
  end

end
