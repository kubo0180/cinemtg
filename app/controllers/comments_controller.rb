class CommentsController < ApplicationController
  def new
  end

  def create
    entry = Entry.find params[:entry_id]
    @created_comment = entry.comments.create params[:comment]
    if (@created_comment)
      @comment = Comment.find :last
      @comment = @created_comment
    end
  end

end
