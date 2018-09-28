class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: current_user[:id], album_id: params[:album_id])
    @favorite.save
    redirect_to albums_path, notice: 'お気に入りに登録しました！'
  end
  
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to albums_path, notice: 'お気に入りを解除しました！'
  end
end
