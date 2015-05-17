class AlbumsController < ApplicationController

  before_action :authenticate_user!

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    Album.create(album_params)
    redirect_to action: :index
  end

  def edit
    @album = Album.find(album_id)
  end

  def update
    if album = Album.find(album_id)
      album.update_attributes(album_params)
    end
    redirect_to action: :edit, notice: "Album updated!"
  end

  def destroy
    if album = Album.find(album_id)
      album.destroy
    end
    redirect_to action: :index
  end


  private

  def album_params
    params[:album].permit!
  end

  def album_id
    params.permit(:id).require(:id)
  end


end
