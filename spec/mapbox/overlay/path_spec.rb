require 'spec_helper'

describe Mapbox::Overlay::Path do

  describe '#initialize' do
    it 'base options' do
      overlay =  Mapbox::Overlay::Path.new(
        polyline: 'jij4oij432oi'
      )
      expect(overlay.generate_overlay).to be == 'path(jij4oij432oi)'
    end

    it 'base and stroke' do
      overlay =  Mapbox::Overlay::Path.new(
          polyline: 'jij4oij432oi',
          strokecolor: 'FF00FF',
          fillcolor: '0000FF',
          size: 4
      )
      expect(overlay.generate_overlay).to be == 'path-4+FF00FF+0000FF(jij4oij432oi)'
    end

    it 'wrong polyline argument' do
      expect { Mapbox::Overlay::Path.new(size: 2) }.to raise_error(ArgumentError)
    end

  end

end