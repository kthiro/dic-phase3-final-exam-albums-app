class AlbumsController < ApplicationController
  
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_login, only: [:new, :confirm, :create, :show, :edit, :destroy]
  
  def new
    if params[:back]
      @album = current_user.albums.new(album_params)
      image_retrieve_from_cache
    else
      @album = current_user.albums.new
    end
  end

  def confirm
    @album = current_user.albums.new(album_params)
    render 'new' if @album.invalid?
  end
  
  def create
    @album = current_user.albums.new(album_params)
    image_retrieve_from_cache
    @album.save
    # AlbumMailer.album_mail(@album).deliver
    redirect_to albums_path, notice: '新しい写真を投稿しました！'
  end

  def index
    @albums = Album.all
    @favorites = current_user.favorites if logged_in?
  end

  def show
  end

  def edit
  end

  def update
    @album.update(album_params)
    redirect_to albums_path, notice: '投稿を編集しました！'
  end

  def destroy
    @album.destroy
    redirect_to albums_path, notice: '投稿を削除しました！'
  end
  
  private
  
  def album_params
    params.require(:album).permit(:title, :content, :image, :image_cache, :photographer)
  end
  
  def image_retrieve_from_cache
    unless params[:album][:image_cache] = ""
      @album.image.retrieve_from_cache! params[:album][:image_cache]
    end
  end
  
  def set_album
    @album = Album.find(params[:id])
  end
  
  def redirect_to_login
    unless logged_in?
      redirect_to new_session_path, notice: "指定したページの閲覧にはログインが必要です。"
    end
  end
  
end
