require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  describe '#index' do
    it 'render index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'search' do
    it 'should set query and page vars' do
      post :search, query: 'apple'
      expect(assigns(:page)).to eq(1)
      expect(assigns(:query)).to eq('apple')
    end

    context 'html format' do
      it 'render index template' do
        post :search, query: 'apple'
        expect(response).to render_template('index')
      end
    end

    context 'js format' do
      it 'render index template' do
        post :search, query: 'apple', format: :js
        expect(response).to render_template('photos')
      end
    end
  end

end
