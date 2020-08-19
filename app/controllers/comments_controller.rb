class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to "/message/#{comment.message.id}" 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, message_id: params[:mesageg_id])
  end

end
