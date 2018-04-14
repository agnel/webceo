module Webceo
  module Api
    #
    # Class Client provides methods to make api requests and handle exceptions
    #
    # @author Agnel Waghela <agnelwaghela@gmail.com>
    #
    class Client
      include HTTParty
      base_uri 'https://online.webceo.com/api/'
      format :json
      headers 'Content-Type' => 'application/json'

      #
      # Intializes an instance of Client to make api calls
      #
      def initialize; end

      #
      # It lists names of all the available API methods on the Webceo API Reference
      #
      # @see https://online.webceo.com/help-center/api-site/seo-api-reference.html
      #
      # @return [Array<String>] List of API Methods
      #
      def list_methods
        API_METHODS.values.flatten
      end

      #
      # This method validates if the method invoked is a valid API Method else raises Error
      # For a valid API Method it builds the request, makes the api call and parses the
      # response and check for any errors in response returned
      #
      # @param [String] method_name Name of the api method invoke
      # @param [Hash] data Any arguments required to sent along with the method
      #
      # @return [Array<Hash>] Array of Response hashes for the request made
      #
      def method_missing(method_name, data = {})
        if list_methods.include? method_name.to_s
          request = Webceo::Api::Request.new method_name, data
          response = make_request(request)
          error = response.check_for_errors
          raise error if error.is_a? Webceo::Api::Error
          response.parse_json
        else
          raise Webceo::Api::ClientError.new(400, nil, {"errormsg" => "Unknown command","method" => method_name.to_s,"result" => 10})
        end
      end

      #
      # This method makes the actual hit to the Webceo API Server and returns the response
      # wrapped with our Response class.
      #
      # It also raises any errors occurred when making the request
      #
      # @param [Webceo::Api::Request] request Api Request Object
      #
      # @return [Webceo::Api::Response] Api Response from server wrapped with our Response class
      #
      def make_request(request)
        result = self.class.post('/', body: request.to_json)

        if result.code >= 500
          raise Webceo::Api::ServerError.new(result.code, result.body)
        end

        if result.code >= 400
          raise Webceo::Api::ClientError.new(result.code, result.body)
        end

        Webceo::Api::Response.new(result.code, result.body, result.headers, result.message)
      end

      def batch(options = {}, &block)
        batch_client = Webceo::Api::BatchClient.new
        if block
          yield batch_client
          batch_client.make_request
        else
          batch_client
        end
      end
    end # end of class Client
  end # end of module Api
end # end of module Webceo
