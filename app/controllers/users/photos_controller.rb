class Users::PhotosController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def index
    @user   = User.find(params[:user_id])
    @album  = @user.albums.find(params[:album_id])
    @photos = @album.photos.page(params[:page] || 1)

    respond_with(@photos) do |format|
      format.html { render }
      format.json { render json: @photos.to_json(methods: :thumbnail_url) }
    end
  end

  def create
    user   = User.find(params[:user_id])
    album  = user.albums.find(params[:album_id])
  
    photos_uploaded = []

    params[:files].each do |file|
      photos_uploaded << album.photos.create(title: file.original_filename, image: file)
    end

    respond_with(photos_uploaded) do |format|
      format.json { render json: photos_uploaded.to_json(root: false) }
    end
  end

  def update
    user   = User.find(params[:user_id])
    album  = user.albums.find(params[:album_id])
    photo  = album.photos.find(params[:id])
    photo.update_attributes(params[:photo])

    respond_with(photo) do |format|
      format.json { render json: photo.to_json(root: false) }
    end
  end

  def destroy
    user   = User.find(params[:user_id])
    album  = user.albums.find(params[:album_id])
    photo  = album.photos.find(params[:id])
    photo.delete

    respond_with(photo) do |format|
      format.json { render json: photo.to_json(root: false) }
    end
  end
end
