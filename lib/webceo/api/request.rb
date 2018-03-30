module Webceo
  module Api
    #
    # Class Request provides wrapper for the request parameters for the api call to be made
    # It also provides a to_json method to build the JSON format request to be sent as
    # the body for the API call
    #
    # @author Agnel Waghela <agnelwaghela@gmail.com>
    #
    class Request
      attr_accessor :method_name, :data

      #
      # Initializes a Request instance for use in our Client
      #
      # @param [String] method_name Name of the API Method to invoke
      # @param [Hash] data Any arguments required to sent along with the method
      #
      def initialize(method_name, data = {})
        @method_name = method_name
        @data = data.with_indifferent_access
      end

      #
      # This method returns a JSON format of the complete request to be sent to
      # the Webceo API server
      #
      # It also appends the api_key necessary for the API call to be successfull
      #
      #
      # @return [JSON] API Request Hash
      #
      def to_json
        MultiJson.dump({
          method: @method_name.to_s,
          key: Webceo::Api::Client.default_options[:api_key],
          id: @data[:id],
          data: @data
        })
      end
    end # end of class Request
  end # end of module Api
end # end of module Webceo
