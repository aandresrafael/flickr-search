require 'rails_helper'

RSpec.describe PhotosHelper, type: :helper do
  describe '#img_url' do
    let(:photo) {
      double(farm: 2, server: 1, id: '1', secret: 'xx')
    }

    it 'should return url for small version' do
      expect(helper.img_url(photo, 'q')).to eq('https://farm2.staticflickr.com/1/1_xx_q.jpg')
    end

    it 'should return url for original version' do
      expect(helper.img_url(photo, 'c')).to eq('https://farm2.staticflickr.com/1/1_xx_c.jpg')
    end
  end
end
