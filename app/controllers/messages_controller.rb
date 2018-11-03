class MessagesController < ApplicationController
  # before_action :set_messages

  def show
  end

  def edit
  end

  def delete
  end

  def update
  end

  def new
    @user = current_user
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      MessageMailer.set_complete(@message).deliver
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def message_params
    params.require(:message).permit(
      :when_message,
      :sender_name,
      :content,
      :image,
      :user_id,
      :type_id,
      :answer1,
      :answer2
    )
  end

  def set_messages
    @message = Message.find(params[:id])
  end
end
