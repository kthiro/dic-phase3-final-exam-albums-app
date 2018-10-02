class AlbumMailer < ApplicationMailer
  def album_mail(album)
    @album = album
    
    # binding.pry
    
    mail to: @album.user.email, subject: "新しい写真を投稿しました"
  end
end
