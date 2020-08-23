class MessagesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    # binding.pry
    @message = Message.create(message_params)
    # @message.user = current_user
    @message.save
    # if 
    #   redirect_to messages_path, notice: 'メッセージが送信されました'
    # else
    #   @messages = messages.includes(:user)
    #   flash.now[:alert] = 'メッセージを入力してください。'
    #   render :new
    # end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
  end

  def edit
  end

  def update
    message Message.find(params[:id])
    message.update(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:title, :name, :text, :nickname)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end