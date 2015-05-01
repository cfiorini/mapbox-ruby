require 'tempfile'
require 'awesome_print'
require 'mapbox/base'

module Mapbox
  # Image class
  class Image < Mapbox::Base
    def initialize(opts = {})
      super(opts)
      @map_type ||= 'png'

      @llz = llz
      @wh = wh
      parameters_check
    end

    def parameters_check
      super
      fail ArgumentError,
           ':lon must be between -180 to 180' unless (-180..180).to_a.include?(@lon)
      fail ArgumentError,
           ':lat must be between -85 to 85' unless (-85..85).to_a.include?(@lat)
      fail ArgumentError,
           ':zoom must be between 0 to 15' unless (0..15).to_a.include?(@zoom)
    end

    def response
      ::Tempfile.open("foo.#{@map_type}") do |r|
        r.write get.data[:body]
      end
    end
  end
end