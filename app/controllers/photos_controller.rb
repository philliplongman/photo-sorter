class PhotosController < ApplicationController

  def edit
    @photo = Photo.find(params[:id])
    @tag_groups = TagGroup.includes(:tags)
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.tag_ids = tag_ids_from_params
    @photo.tagged_at = (@photo.tag_ids.empty?) ? nil : DateTime.now

    flash.alert = "Error" unless @photo.save
    redirect_to random_photos_path
  end

  def random
    @photo = Photo.where(tagged_at: nil).random_order.first
    @tag_groups = TagGroup.includes(:tags)
    render :edit
  end

  private

  def tag_ids_from_params
    params[:tag_ids].select {|k, v| v == "1"}.keys
  end

end
