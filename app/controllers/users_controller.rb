class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :require_authorization!, except: [:new, :create]
  after_action :verify_authorized, except: :index

  def new
    authorize User
    @user = User.new
  end

  def create
    authorize User
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Successfully signed in"
    else
      render 'new'
    end
  end

  def show
    authorize @user
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
    end
end
