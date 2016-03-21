class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id]) 
  end

  def create
     @video = Video.new(video_params)
     if current_user.nil?
       redirect_to videos_path, notice: "You do not have the rights to add videos."
     elsif current_user.admin?
       if @video.save
         redirect_to videos_path, notice: "The video #{@video.title} has been uploaded."
       else
         render "new"
       end
     else
       redirect_to videos_path, notice: "You do not have the rights to add videos."
     end
  end

  def destroy
   @video = Video.find(params[:id])
   if current_user.nil?
     redirect_to videos_path, notice:  "You do not have the rights to delete."
   elsif current_user.admin?
     @video.destroy
     redirect_to videos_path, notice:  "The video #{@video.title} has been deleted."
   else
     redirect_to videos_path, notice:  "You do not have the rights to delete."
   end
  end

  private
   def video_params
     params.require(:video).permit(:title, :attachment)
   end
end
