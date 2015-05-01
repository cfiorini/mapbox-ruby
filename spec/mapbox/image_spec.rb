require 'spec_helper'

describe Mapbox::Image, :vcr => true do

  let(:mb) {
    Mapbox::Image.new(
        access_token: 'pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg',
        lat: 42,
        lon: 8,
        zoom: 5,
        width: 300,
        height: 300,
        mapid: Mapbox::ID_STREETS
    )
  }

  describe '#base_url' do
    it 'generate for default png type' do
      expect(mb.base_url).to eq('http://api.tiles.mapbox.com/v4/mapbox.streets/42,8,5/300x300.png')
    end
  end

  describe '#get' do
    it 'http response 200' do
      expect(mb.get.status).to eq(200)
    end
  end

  describe '#overlays' do
    it 'add one overlay' do
      mb.overlays << Mapbox::Overlay::Marker.add(
          lat: 42,
          lon: 8,
          size: 'm',
          label: 'beer',
          color: '0000FF'
      )

      expect(mb.base_url).to eq('http://api.tiles.mapbox.com/v4/mapbox.streets/pin-m-beer+0000FF(42,8)/42,8,5/300x300.png')
    end

    it 'add one more overlay' do
      mb.overlays << Mapbox::Overlay::Marker.add(
          lat: 42,
          lon: 8,
          size: 'm',
          label: 'park',
          color: '0000FF'
      )

      mb.overlays << Mapbox::Overlay::Marker.add(
          lat: 42,
          lon: 8,
          size: 'l',
          label: 'beer',
          color: 'FF00FF'
      )

      expect(mb.base_url).to eq('http://api.tiles.mapbox.com/v4/mapbox.streets/pin-m-park+0000FF(42,8),pin-l-beer+FF00FF(42,8)/42,8,5/300x300.png')
    end
  end

  # describe '#response' do
  #   it 'get tempfile' do
  #     expect(mb.response.class).to be_kind?(::Tempfile)
  #   end
  # end

end