module Mapbox
  module Overlay
    # Marker class
    class Marker < Base
      MAKI = %w(
        a-z 0-9 airfield airport alcohol-shop america-football art-gallery
        bakery bank bar baseball basketball beer bicycle building bus cafe
        camera campsite car cemetery chemist cinema circle-stroked circle
        city clothing-store college commercial cricket cross dam danger
        dentist disability dog-park embassy emergency-telephone entrance
        farm fast-food ferry fire-station fuel garden gift golf grocery
        hairdresser harbor heart heliport hospital ice-cream industrial
        land-use laundry library lighthouse lodging logging london-underground
        marker-stroked marker minefield mobilephone monument museum music
        oil-well park2 park parking-garage parking pharmacy pitch place-of-worship
        playground police polling-place post prison rail-above rail-light rail-metro
        rail-underground rail religious-christian religious-jewish religious-muslim
        restaurant roadblock rocket school scooter shop skiing slaughterhouse
        soccer square-stroked square star-stroked star suitcase swimming
        telephone tennis theatre toilets town-hall town triangle-stroked
        triangle village warehouse waste-basket water wetland zoo
      )

      def arguments_check
        return if @label.nil?
        fail ArgumentError, ":label not found: #{@label}" if MAKI.include?(@label) == false
      end

      def generate_overlay
        oly = []
        oly << "pin-#{@size}"
        oly << "-#{@label}" unless @label.nil?
        oly << "+#{@color}" unless @color.nil?
        oly << "(#{@lat},#{@lon})"
        oly.join
      end
    end
  end
end
