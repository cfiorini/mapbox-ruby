require 'spec_helper'

describe Mapbox::Geocode, :vcr => true do

  describe '#base_url' do

    mg = Mapbox::Geocode.new(
          access_token: 'pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg',
          query: '1 ocean drive miami beach',
      )

    it 'forward geocoding url' do
      expect(mg.base_url).to eq('http://api.tiles.mapbox.com/v4/geocode/mapbox.places/1%20ocean%20drive%20miami%20beach.json')
    end
  end


  describe '#get' do

    mg = Mapbox::Geocode.new(
        access_token: 'pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg',
        query: '1 ocean drive miami beach',
    )

    it 'forward geocoding http request' do
      expect(mg.get).to eq({"type"=>"FeatureCollection", "query"=>["1", "ocean", "drive", "miami", "beach"],
                            "features"=>[{"id"=>"address.3803477900", "type"=>"Feature", "text"=>"Ocean Dr",
                                          "place_name"=>"1 Ocean Dr, Miami, 33139, Florida, United States",
                                          "relevance"=>0.8, "center"=>[-80.13245, 25.768924],
                                          "geometry"=>{"type"=>"Point", "coordinates"=>[-80.13245, 25.768924]},
                                          "bbox"=>[-80.13356099999999, 25.768513999999993,
                                                   -80.12883499999998, 25.788005999999992],
                                          "address"=>"1", "properties"=>{},
                                          "context"=>[{"id"=>"place.3389175508", "text"=>"Miami"},
                                                      {"id"=>"postcode.260297597", "text"=>"33139"},
                                                      {"id"=>"region.3998021366", "text"=>"Florida"},
                                                      {"id"=>"country.4150104525", "text"=>"United States"}]}],
                            "attribution"=>"NOTICE: You may cache this data for up to 30 days. © 2015 Mapbox and its suppliers. All rights reserved. Use of this data is subject to the Mapbox Terms of Service. (https://www.mapbox.com/about/maps/)"})
    end
  end


  describe '#base_url' do

    mg = Mapbox::Geocode.new(
        access_token: 'pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg',
        lat: '25.768924',
        lon: '-80.13245',
    )

    it 'reverse geocoding url' do
      expect(mg.base_url).to eq('http://api.tiles.mapbox.com/v4/geocode/mapbox.places/-80.13245,25.768924.json')
    end
  end


  describe '#get' do

    mg = Mapbox::Geocode.new(
        access_token: 'pk.eyJ1IjoiY2Zpb3JpbmkiLCJhIjoiYndTSkpTTSJ9.amV6cXvWGA9vjXM4aclTwg',
        lat: '25.768924',
        lon: '-80.13245',
    )

    it 'reverse geocoding http request' do
      expect(mg.get).to eq({"type"=>"FeatureCollection", "query"=>[-80.13245, 25.768924],
                            "features"=>[{"id"=>"address.3803477900", "type"=>"Feature", "text"=>"Ocean Dr",
                                          "place_name"=>"1 Ocean Dr, Miami Beach, 33139, Florida, United States",
                                          "relevance"=>1, "center"=>[-80.13245, 25.768924],
                                          "geometry"=>{"type"=>"Point", "coordinates"=>[-80.13245, 25.768924]},
                                          "bbox"=>[-80.13356099999999, 25.768513999999993,
                                                   -80.12883499999998, 25.788005999999992],
                                          "address"=>"1", "properties"=>{},
                                          "context"=>[{"id"=>"place.33109", "text"=>"Miami Beach"},
                                                      {"id"=>"postcode.260297597", "text"=>"33139"},
                                                      {"id"=>"region.3998021366", "text"=>"Florida"},
                                                      {"id"=>"country.4150104525", "text"=>"United States"}]},
                                         {"id"=>"place.33109", "type"=>"Feature", "text"=>"Miami Beach",
                                          "place_name"=>"Miami Beach, 33139, Florida, United States",
                                          "relevance"=>1, "center"=>[-80.13, 25.7906],
                                          "geometry"=>{"type"=>"Point", "coordinates"=>[-80.13, 25.7906]},
                                          "bbox"=>[-80.1870820072649, 25.74767699025125,
                                                   -80.11019199000681, 25.87264400999986],
                                          "properties"=>{}, "context"=>[{"id"=>"postcode.260297597", "text"=>"33139"},
                                                                        {"id"=>"region.3998021366", "text"=>"Florida"},
                                                                        {"id"=>"country.4150104525", "text"=>"United States"}]},
                                         {"id"=>"postcode.260297597", "type"=>"Feature",
                                          "text"=>"33139", "place_name"=>"33139, Florida, United States",
                                          "relevance"=>1, "center"=>[-80.145871, 25.784034],
                                          "geometry"=>{"type"=>"Point", "coordinates"=>[-80.145871, 25.784034]},
                                          "bbox"=>[-80.18708199999999, 25.760044999999998,
                                                   -80.11928499999999, 25.804382999999998],
                                          "properties"=>{}, "context"=>[{"id"=>"region.3998021366", "text"=>"Florida"},
                                                                        {"id"=>"country.4150104525", "text"=>"United States"}]},
                                         {"id"=>"region.3998021366", "type"=>"Feature", "text"=>"Florida",
                                          "place_name"=>"Florida, United States", "relevance"=>1,
                                          "center"=>[-81.553615, 27.649402], "geometry"=>{"type"=>"Point",
                                                                                          "coordinates"=>[-81.553615, 27.649402]},
                                          "bbox"=>[-87.63474399999998, 24.399347999999996,
                                                   -79.97430599999998, 31.000680999999993],
                                          "properties"=>{}, "context"=>[{"id"=>"country.4150104525", "text"=>"United States"}]},
                                         {"id"=>"country.4150104525", "type"=>"Feature", "text"=>"United States",
                                          "place_name"=>"United States", "relevance"=>1, "center"=>[-98.958425, 36.778951],
                                          "geometry"=>{"type"=>"Point", "coordinates"=>[-98.958425, 36.778951]},
                                          "bbox"=>[-179.23023299999997, 18.866158999999996,
                                                   179.85968099999994, 71.43776899999999], "properties"=>{}}],
                            "attribution"=>"NOTICE: You may cache this data for up to 30 days. © 2015 Mapbox and its suppliers. All rights reserved. Use of this data is subject to the Mapbox Terms of Service. (https://www.mapbox.com/about/maps/)"})
    end
  end

end