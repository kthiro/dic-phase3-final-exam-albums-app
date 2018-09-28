module AlbumsHelper
  def choose_new_album_or_edit_album
    if action_name == 'new' || action_name == 'confirm'
      confirm_albums_path
    elsif action_name == 'edit'
      album_path(@album.id)
    end
  end
end
