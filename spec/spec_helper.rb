require 'bundler/setup'

Bundler.setup

#require 'webmock/rspec'
require 'mapbox'
require 'vcr'

# VCR.configure do |config|
#   config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
#   config.hook_into :webmock
#   config.configure_rspec_metadata!
#   config.allow_http_connections_when_no_cassette = true
# end

RSpec.configure do |config|
  config.before(:each) do
    # stub_request(:get, "http://api.tiles.mapbox.com/v4/mapbox.streets.html?access_token=pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg")
    #     .with(:headers => {'Host'=>'api.tiles.mapbox.com:80', 'User-Agent'=>'excon/0.45.3'})
    #     .to_return(:status => 200, :body => "<!DOCTYPE html>", :headers => {})
    #
    # stub_request(:get, "http://api.tiles.mapbox.com/v4/mapbox.streets/42,8,5/300x300.png?access_token=pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg")
    #     .with(:headers => {'Host'=>'api.tiles.mapbox.com:80', 'User-Agent'=>'excon/0.45.3'})
    #     .to_return(:status => 200, :body => "jf032jfj230", :headers => {})

  end
end