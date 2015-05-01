require 'spec_helper'

describe Mapbox::Html, :vcr => true do

  let(:mb) {
    Mapbox::Html.new(
        access_token: 'pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg',
        mapid: Mapbox::ID_STREETS
    )
  }

  describe '#base_url' do
    it 'with map_option' do
      mb.map_option = 'geocoder'
      expect(mb.base_url).to eq('http://api.tiles.mapbox.com/v4/mapbox.streets/geocoder.html')
    end

    it 'without map_option' do
      expect(mb.base_url).to eq('http://api.tiles.mapbox.com/v4/mapbox.streets.html')
    end
  end

  describe '#get' do
    it 'http response 200' do
      expect(mb.get.status).to eq(200)
    end
  end

  describe '#response' do
    it 'get html' do
      expect(mb.response).to start_with('<!DOCTYPE html>')
    end
  end

end