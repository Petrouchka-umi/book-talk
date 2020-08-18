class MessagesController < ApplicationController
  def index
    @messages = Meesage.all
  end
end
