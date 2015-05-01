require 'mapbox/base'

module Mapbox
  # Html map
  class Html < Mapbox::Base
    def initialize(opts = {})
      super(opts)
      @map_type = 'html'
    end

    def response
      get.body
    end
  end
end
