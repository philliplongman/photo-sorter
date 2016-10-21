class PhotosController < ApplicationController

  def edit
    @photo = Photo.find(params[:id])
  end

  def update

  end

  def random
    @photo = Photo.where(tagged_at: nil).random_order.first
    render :edit
  end

end
