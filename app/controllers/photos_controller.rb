require 'flickraw'
class PhotosController < ApplicationController
  def index
  end

  def search
    redirect_to root_path and return if params[:query].blank?
    @photos = []
    FlickRaw.api_key = Rails.application.secrets.flickr_key
    FlickRaw.shared_secret = Rails.application.secrets.flickr_secret

    flickr.photos.search(:tags => params[:query], :per_page => 100).each do |photo|
      @photos << photo
    end

    render :index
  end
end
