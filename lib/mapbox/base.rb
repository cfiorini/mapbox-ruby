require 'excon'
require 'forwardable'

module Mapbox
  # Base class
  class Base
    extend Forwardable

    attr_accessor :map_option, :overlays
    # attr_accessor :access_token, :access_token_secret
    # attr_accessor :mapid, :map_type
    # attr_accessor :z, :x, :y
    # attr_accessor :lat, :lon, :zoom

    def_delegator :connection, :get, :get

    def initialize(opts = {})
      opts.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      @overlays ||= []

      yield(self) if block_given?
    end

    def arguments_check
      fail ArgumentError, ':access_token' if @access_token.nil?
      fail ArgumentError, ':mapid' if @mapid.nil?
    end

    def base_url
      tmp_overlays = @overlays.join(',') if @overlays.size > 0
      tmp_overlays ||= nil

      [API_URL, API_VERSION, @mapid, tmp_overlays,
       @llz, @z, @x, @y, @map_option,
       @index, @query, @wh]
        .compact
        .join('/') + ".#{@map_type}"
    end

    def connection
      Excon.new(base_url, query: { access_token: @access_token })
    end

    # latitude longitude zoom
    def llz
      [@lat, @lon, @zoom].join(',')
    end

    # width and height
    def wh
      [@width, @height].join('x')
    end
  end
end
