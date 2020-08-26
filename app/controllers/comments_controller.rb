class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to  message_path(comment.message.id) 

    # if @message.save
    #   redirect_to messages_path, notice: 'コメントが投稿されました'
    # else
    #   flash.now[:alert] = 'コメントを入力してください。'
    #   render :show
    # end

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, message_id: params[:message_id])
  end

end
