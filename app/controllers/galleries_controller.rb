class GalleriesController < ApplicationController
  before_filter :is_admin?, :except => [ :index, :show ]
  
  def index
    #@galleries = Gallery.all
    
    if current_user.try(:admin?)
      @galleries = Gallery.all
    elsif user_signed_in?
      @galleries = Gallery.where( :visibility => 1..2 )
    else
      @galleries = Gallery.where( :visibility => 2 )
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    if @gallery.visibility == 0 && !current_user.try(:admin?)
      redirect_to galleries_path
    elsif @gallery.visibility == 1 && !user_signed_in?
      redirect_to galleries_path
    end
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      redirect_to @gallery
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to gallery_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_url
  end
end
