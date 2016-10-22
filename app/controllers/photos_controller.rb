class PhotosController < ApplicationController

  def edit
    @photo = Photo.find(params[:id])
    @tag_groups = TagGroup.includes(:tags)
  end

  def update

  end

  def random
    @photo = Photo.where(tagged_at: nil).random_order.first
    @tag_groups = TagGroup.includes(:tags)
    render :edit
  end

end
