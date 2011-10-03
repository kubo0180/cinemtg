class RlogController < ApplicationController
  def index
    @user = User.find(params[:id])
    @books = Book.where("user_id=?", @user.id).latest
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:book_id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @book }
    end
  end
end
