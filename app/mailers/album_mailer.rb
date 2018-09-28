class AlbumMailer < ApplicationMailer
  def album_mail(album)
    @album = album
    mail to: User.find(@album.user_id).email, subject: "新しい写真を投稿しました"
  end
end
