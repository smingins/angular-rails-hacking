class Users::PhotosController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def index
    @user   = User.find(params[:user_id])
    @album  = @user.albums.find(params[:album_id])
    @photos = @album.photos

    respond_with(@photos) do |format|
      format.html { render }
      format.json { render json: @photos.to_json }
    end
  end
end
