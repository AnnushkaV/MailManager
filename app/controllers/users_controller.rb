class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end
  def show
    @user = User.find(params[:id])
    unless @users
      render text: "Page not found", status: 404
    end
  end
  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
