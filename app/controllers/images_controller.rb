class ImagesController < ApplicationController
  def new; end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def show; end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
