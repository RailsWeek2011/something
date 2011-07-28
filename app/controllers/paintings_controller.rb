class PaintingsController < ApplicationController
  def new
    @painting = Painting.new(:gallery_id => params[:gallery_id])
  end

  def create
    @painting = Painting.new(params[:painting])
    if @painting.save
      redirect_to @painting.gallery
    else
      render :action => 'new'
    end
  end

  def show
    @painting = Painting.find(params[:id])
    if @painting.gallery.visibility == 0 && !current_user.try(:admin?)
      redirect_to galleries_path
    elsif @painting.gallery.visibility == 1 && !user_signed_in?
      redirect_to galleries_path
    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      redirect_to @painting.gallery
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to @painting.gallery
  end
      
  rescue_from CarrierWave::DownloadError, :with => :errorCW

  protected
  def errorCW
    flash[:alert] = "Imageupload failed, just http:"
    redirect_to :back
  end

end
