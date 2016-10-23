class PhotosController < ApplicationController

  def edit
    @photo = Photo.find(params[:id])
    tag_groups
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.tag_ids = tag_ids_from_params
    @photo.tagged_at = (@photo.tag_ids.empty?) ? nil : DateTime.now

    flash.alert = "Error" unless @photo.save
    redirect_to root_path
  end

  def random
    @photo = Photo.where(tagged_at: nil).random_order.first
    tag_groups
    render :edit
  end

  def undo
    @photo = Photo.where.not(tagged_at: nil).order(:tagged_at).last
    @photo.update(tagged_at: nil)
    tag_groups
    render :edit
  end

  private

  def tag_ids_from_params
    params[:tag_ids].select {|k, v| v == "1"}.keys
  end

  def tag_groups
    @tag_groups = TagGroup.includes(:tags)
  end

end
