require 'tempfile'
require 'mapbox/base'

module Mapbox
  # Image class
  class Image < Mapbox::Base
    def initialize(opts = {})
      super(opts)
      @map_type ||= 'png'

      @llz = llz
      @wh = wh
      arguments_check
    end

    def arguments_check
      super
      fail ArgumentError, ':width must be less than 1280' if @width > 1280
      fail ArgumentError, ':height must be less than 1280' if @height > 1280
      fail ArgumentError, ':lon must be between -180 to 180' unless (-180..180).to_a.include?(@lon)
      fail ArgumentError, ':lat must be between -85 to 85' unless (-85..85).to_a.include?(@lat)
      fail ArgumentError, ':zoom must be between 0 to 15' unless (0..15).to_a.include?(@zoom)
    end

    def response
      ::Tempfile.open("foo.#{@map_type}") do |r|
        r.write get.data[:body]
      end
    end
  end
end
