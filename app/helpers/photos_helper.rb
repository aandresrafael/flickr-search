module PhotosHelper
  # Returns the url for photos according to the size.
  # @param photo [Json] photo jason data from Flickr
  # @param  size [String] A string with the size of photo IE: 'q' small, 'c' original
  def img_url(photo, size)
    base_img_url = "https://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_?.jpg"
    base_img_url.gsub('?', size)
  end
end
