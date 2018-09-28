class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end

  def confirm
    @user = User.new(user_params)
    render 'new' if @user.invalid?
  end
  
  def create
    @user = User.new(user_params)
    begin
      @user.save
      redirect_to new_session_path, notice: 'ユーザー登録が完了しました。登録した内容でログインして下さい。'
    rescue ActiveRecord::RecordNotUnique
      flash.now[:danger] = "既に登録済みのメールアドレスです。他のメールアドレスで登録してください。"
      render 'new'
    end
  end
    

  def show
    if current_user.id == @user.id
      @favorite_albums = current_user.favorite_albums
      @my_albums = Album.where(user_id: current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def edit
  end
  
  def update
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'ユーザー情報を更新しました！'
  end
  
  def destroy
    @user.destroy
    redirect_to new_user_path, notice: 'ユーザー情報を削除しました！'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

end
