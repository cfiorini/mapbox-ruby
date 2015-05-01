require 'spec_helper'

describe Mapbox::Overlay::Marker do

  describe '#initialize' do
    it 'base options' do
      marker =  Mapbox::Overlay::Marker.new(
          lat: 42,
          lon: 8,
          size: 'm'
      )
      expect(marker.generate_overlay).to be == 'pin-m(42,8)'
    end

    it 'base and label' do
      marker =  Mapbox::Overlay::Marker.new(
          lat: 42,
          lon: 8,
          size: 'm',
          label: 'beer'
      )
      expect(marker.generate_overlay).to be == 'pin-m-beer(42,8)'
    end

    it 'base and color' do
      marker =  Mapbox::Overlay::Marker.new(
          lat: 42,
          lon: 8,
          size: 'm',
          color: '0000FF'
      )
      expect(marker.generate_overlay).to be == 'pin-m+0000FF(42,8)'
    end

    it 'all params' do
      marker =  Mapbox::Overlay::Marker.new(
          lat: 42,
          lon: 8,
          size: 'm',
          label: 'beer',
          color: '0000FF'
      )
      expect(marker.generate_overlay).to be == 'pin-m-beer+0000FF(42,8)'
    end

    it 'wrong label argument' do
      expect { Mapbox::Overlay::Marker.new(lat: 42, lon: 8, size: 'm', label: 'cippa') }.to raise_error(ArgumentError)
    end

  end

end