module Mapbox
  module Overlay
    # Path class
    class Path < Base
      def arguments_check
        fail ArgumentError, ':polyline not found' if @polyline.nil?
      end

      def generate_overlay
        oly = []
        oly << 'path'
        oly << "-#{@size}" unless @size.nil?
        oly << "+#{@strokecolor}" unless @strokecolor.nil?
        oly << "-#{@strokeopacity}" unless @strokeopacity.nil?
        oly << "+#{@fillcolor}" unless @fillcolor.nil?
        oly << "-#{@fillopacity}" unless @fillopacity.nil?

        oly << "(#{@polyline})"
        oly.join
      end
    end
  end
end
