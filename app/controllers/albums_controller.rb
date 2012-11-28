class AlbumsController < ApplicationController
  respond_to :html

  def index
    @albums = Album.all
    respond_with @albums
  end

  def show
    @album = Album.find_by_id(params[:id])
    respond_with @album
  end

  def new
    @album = Album.new
    respond_with @album
  end

  def create
    @album = Album.new(params[:album])
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, :flash => {:message => 'New album added to your collection' }}
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @album = Album.find_by_id(params[:id])
  end

  def update
    @album = Album.find_by_id(params[:id])
    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, :flash => {:message => 'New album added to your collection' } }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, :flash => {:message => 'New album added to your collection' } }
    end
  end
  
end
