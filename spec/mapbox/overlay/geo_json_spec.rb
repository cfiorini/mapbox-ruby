require 'spec_helper'

describe Mapbox::Overlay::GeoJson do

  describe '.initialize' do

    it 'exception' do
      expect { Mapbox::Overlay::GeoJson.new }.to raise_error(Exception)
    end

  end

end