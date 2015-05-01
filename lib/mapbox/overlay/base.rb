module Mapbox
  module Overlay
    # Overlay base class
    class Base
      def self.add(opts = {})
        a = new(opts)
        a.generate_overlay
      end

      def initialize(opts = {})
        opts.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
        arguments_check
      end

      def arguments_check; end

      def generate_overlay
        fail Exception 'You cannot call generate_overlay from Base class'
      end
    end
  end
end
