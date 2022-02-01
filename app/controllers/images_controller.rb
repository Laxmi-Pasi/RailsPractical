class ImagesController < ApplicationController
  
  def index
    @img=Image.all
  end

  def show
    @img = Image.find(params[:id])
  end

  def new
    @img = Image.new
  end

  def create
    img = Image.create(image_params)

    redirect_to images_path
  end

  def edit
    @img = Image.find(params[:id])
  end

  def update
    @img = Image.find(params[:id])
    @img.update(image_params)
    redirect_to images_path
  end

  def destroy
    @img = Image.find(params[:id])
    @img.destroy

    redirect_to images_path
  end

  def image_params
    params.require(:image).permit(:img_name, :book_id, :author_id)
  end
end
