class StaticPagesController < ApplicationController
  def home
    @message = current_user.messages.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
end
