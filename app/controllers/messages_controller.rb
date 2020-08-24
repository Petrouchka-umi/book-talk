class MessagesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_message, only: [:edit, :show]

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
    if @message.save
      redirect_to messages_path, notice: 'メッセージが送信されました'
    else
      # @messages = messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  def destroy
    message = Message.find(params[:id])
    if message.destroy
      redirect_to messages_path, notice: 'メッセージが削除されました'
    end    
  end

  def edit
  end

  def show
  end

  def update
    message = Message.find(params[:id])
    if message.update(message_params)
      redirect_to messages_path, notice: 'メッセージが編集されました'
    end
  end

  private
  def message_params
    params.require(:message).permit(:title, :name, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_message
    @message = Message.find(params[:id])
  end

end