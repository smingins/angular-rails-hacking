class Users::AlbumsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json, :html

  def show
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])

    respond_with(@album) do |format|
      format.html { render }
      format.json { render json: @album.to_json }
    end
  end

  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums

    respond_with(@albums) do |format|
      format.html { render }
      format.json { render json: @albums.to_json(root: false) }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @album = @user.albums.create(params[:album])

    respond_with(@album) do |format|
      format.html { render }
      format.json { render json: @album.to_json(root: false) }
    end
  end

  def update
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
    @album.update_attributes(params[:album])

    respond_with(@album) do |format|
      format.html { render }
      format.json { render json: @album.to_json(root: false) }
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
    @album.delete

    respond_with(@album) do |format|
      format.html { render }
      format.json { render json: @album.to_json(root: false) }
    end
  end
end
