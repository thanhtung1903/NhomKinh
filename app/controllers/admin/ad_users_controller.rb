class Admin::AdUsersController < Admin::BaseController
  before_action :load_user, only: %i(edit update destroy)

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".success"
      redirect_to admin_path
    else
      flash.now[:danger] = t ".failure"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".success"
      redirect_to admin_path
    else
      flash.now[:danger] = t ".failure"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failure"
    end
    redirect_to admin_path
  end

  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def load_user
    return if @user = User.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to admin_path
  end
end
