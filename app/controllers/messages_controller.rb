class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
    # Message.save
    # if
    #   redirect_to messages_path(@message), notice: 'メッセージが送信されました'
    # else
    #   @messages = messages.includes(:user)
    #   flash.now[:alert] = 'メッセージを入力してください。'
    #   render :new
    # end
  end

  private
  def message_params
    params.require(:message).permit(:title, :name, :text, :nickname)
  end

end