class MessageController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @message = Message.all
  end

  def show
  end


  def new
    @message = Message.new
  end


  def edit
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
         redirect_to @message, notice: 'Message was successfully created.'
      else
         render :new
      end
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
  def set_micropost
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
