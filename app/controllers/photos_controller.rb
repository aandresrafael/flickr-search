require 'flickraw'
class PhotosController < ApplicationController
  def index
  end

  def search
    redirect_to root_path and return if params[:query].blank?
    @photos = []
    FlickRaw.api_key = Rails.application.secrets.flickr_key
    FlickRaw.shared_secret = Rails.application.secrets.flickr_secret

    @photos = Rails.cache.fetch(params[:query],
      expires_in: cache_expire,
      race_condition_ttl: race_condition_ttl) do

      flickr.photos.search(tags: params[:query], per_page: per_page ).each do |photo|
        @photos << photo
      end
    end

    render :index
  end

end
