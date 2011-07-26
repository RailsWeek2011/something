class imagesController < ApplicationController
  before_filter :is_admin? , :except => [:index, :show]
  
  # GET /images
  # GET /images.json

  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # album /images
  # album /images.json
  def create
    @album = Album.find (params[:post_id])
    @image = @album.images.create(params[:comment])
    @image.author_id = current_user.id
    


    respond_to do |format|
      if @image.save
        format.html { redirect_to album_path(@album), notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @comment }
      else
        format.html { redirect_to album_path(@album), notice: 'Image was not created.'}
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @album = Album.find(params[:album_id])
    @image = @album.images.find( params[ :id ] )
    @image.destroy

    respond_to do |format|
      format.html { redirect_to album_path(@album) }
      format.json { head :ok }
    end
  end
end
