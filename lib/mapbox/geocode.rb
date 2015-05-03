require 'mapbox/base'
require 'json'

module Mapbox
  # Geocode class
  class Geocode < Mapbox::Base
    def initialize(opts = {})
      opts[:mapid] = 'geocode'
      opts[:index] ||= 'mapbox.places'
      opts[:map_type] = 'json'
      super(opts)

      if @lat.nil? && @lon.nil?
        @query = URI.escape(@query)
      else
        @query = "#{@lon},#{@lat}"
      end
    end

    def get
      tmp = super
      JSON.parse(tmp.data[:body])
    end
  end
end
