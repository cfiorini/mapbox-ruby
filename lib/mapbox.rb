require 'mapbox/overlay'
require 'mapbox/html'
require 'mapbox/image'
require 'mapbox/version'

# Gem
module Mapbox
  class Error < ::StandardError; end

  API_VERSION = 'v4'
  API_URL = 'http://api.tiles.mapbox.com'

  ID_STREETS           = 'mapbox.streets'
  ID_LIGHT             = 'mapbox.light'
  ID_DARK              = 'mapbox.dark'
  ID_SATELLITE         = 'mapbox.satellite'
  ID_STREETS_SATELLITE = 'mapbox.streets-satellites'
  ID_WHEATPASTE        = 'mapbox.wheatpaste'
  ID_STREETS_BASIC     = 'mapbox.streets-basic'
  ID_COMIC             = 'mapbox.comic'
  ID_OUTDOORS          = 'mapbox.outdoors'
  ID_RUN_BIKE_HIKE     = 'mapbox.run-bike-hike'
  ID_PENCIL            = 'mapbox.pencil'
  ID_PIRATES           = 'mapbox.pirates'
  ID_EMERALD           = 'mapbox.emerald'
  ID_HIGH_CONTRAST     = 'mapbox.high-contrast'
end
