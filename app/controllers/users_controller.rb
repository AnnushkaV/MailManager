class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end
  def show
    unless @users
      render text: "Page not found", status: 404
    end
  end
end
