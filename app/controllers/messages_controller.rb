class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  def index
    @message = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end


  def new
    @message = Message.new
  end


  def edit
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Message created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'messages/index'
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        redirect_to @message, notice: 'Message was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      redirect_to message_url, notice: 'Message was successfully destroyed.'
    end
  end

  private
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:messages).permit(:content, :user_id)
  end
end
