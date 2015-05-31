class MessagesController < ApplicationController



  def index
    @message = Message.all
  end

  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Message created!"
      redirect_to root_url
    else
      render 'messages/new'
    end
  end
  def destroy

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
