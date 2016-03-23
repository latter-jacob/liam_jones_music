class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if current_user.nil?
      redirect_to songs_path, notice: "You do not have the rights to add songs."
    elsif current_user.admin?
      if @song.save
        redirect_to songs_path, notice: "The song #{@song.title} has been uploaded."
      else
        render "new"
      end
    else
      redirect_to songs_path, notice: "You do not have the rights to add songs."
    end
  end

  def destroy
    @song = Song.find(params[:id])
    if current_user.nil?
      redirect_to songs_path, notice:  "You do not have the rights to delete."
    elsif current_user.admin?
      @song.destroy
      redirect_to songs_path, notice:  "The song #{@song.title} has been deleted."
    else
      redirect_to songs_path, notice:  "You do not have the rights to delete."
    end
  end

  def download
    @song = Song.find(params[:song_id])
    send_file "#{Rails.root}/public#{@song.url}", filename: "#{@song.title}.mp3"
  end

  private

  def song_params
    params.require(:song).permit(:title, :url)
  end

end
