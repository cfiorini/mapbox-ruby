[![Build Status](https://travis-ci.org/cfiorini/mapbox-ruby.svg?branch=master)](https://travis-ci.org/cfiorini/mapbox-ruby)
[![Code Climate](https://codeclimate.com/github/cfiorini/mapbox-ruby/badges/gpa.svg)](https://codeclimate.com/github/cfiorini/mapbox-ruby)
[![Coverage Status](https://coveralls.io/repos/cfiorini/mapbox-ruby/badge.svg)](https://coveralls.io/r/cfiorini/mapbox-ruby)

A Ruby interface to the [Mapbox](https://www.mapbox.com) API.

### This gem is under development, use with precautions

## Installation

    gem install mapbox-ruby
    
or in Bundler:

	gem 'mapbox-ruby'    

In order to use this gem you need a valid access_token from [Mapbox](https://www.mapbox.com) and how Mapbox works.

## Usage

### Html

	html = Mapbox::Html.new(access_token: 'xxxxxxxxxxx', mapid: Mapbox::ID_STREETS)
	html.get # return a valid html page with the map

### Image

	img = Mapbox::Image.new(access_token: 'xxxxxxxxxxx', mapid: Mapbox::ID_STREETS, 
							lat: 42, lon: 8, zoom: 5, width: 500, height: 300)
	img.get # return a ruby Tempfile
	
With Mapbox::Image	you can use [Overlays](https://www.mapbox.com/developers/api/static/#overlay) (GeoJSON not supported yet from mapbox-ruby)

	img.overlays << Mapbox::Overlay::Marker.add(
          lat: 42,
          lon: 8,
          size: 'm',
          label: 'beer',
          color: '0000FF'
      )

	img.overlays << Mapbox::Overlay::Path.add(
          size: '5',
          polyline: 'xxxxxx' 
      )

Read more about [Polyline](https://developers.google.com/maps/documentation/utilities/polylinealgorithm)

### Geocoding

	# Forward geocode
	mg = Mapbox::Geocode.new(access_token: 'xxxxxxxxxxx', query: '1 ocean drive miami beach' )
	mg.get # return ruby Hash with mapbox body response

	# Reverse geocode	
	mg = Mapbox::Geocode.new(access_token: 'xxxxxxxxxxx',
								lat: '25.768924',
								lon: '-80.13245')
	mg.get # return ruby Hash with mapbox body response