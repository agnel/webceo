module Webceo
  module Api
    #
    # Class Response provides a customize response instance to use in our client based
    # on the response returned by the Webceo API Server
    #
    # @author Agnel Waghela <agnelwaghela@gmail.com>
    #
    class Response
      attr_reader :status, :body, :headers, :message

      # Creates a new Response object, which standardizes the response received for use within Webceo
      def initialize(status, body, headers, message = nil)
        @status = status
        @body = body
        @headers = headers
        @message = message
      end

      #
      # This method checks for any errors in the response returned from the api call
      #
      # @see Webceo::Api::RESPONSE_CODES
      #
      def check_for_errors
        info = (self.parse_json.is_a?(Array)) ? self.parse_json.first : self.parse_json
        if info[:result] && info[:result] != 0
          if info[:result] == 500
            Webceo::Api::ServerError.new(self.status.to_i, info)
          else
            Webceo::Api::ClientError.new(self.status.to_i, info)
          end
        end
      end

      #
      # This method parses the response body symbolizing the keys
      # It raises errors encountered when parsing response body
      #
      # @return [Array<Hash>] JSON parsed response
      #
      def parse_json(options = {})
        begin
          ::MultiJson.load(self.body, :symbolize_keys => true)
        rescue ::MultiJson::ParseError => e
          e.cause
        end
      end
    end # end of class Response
  end # end of module Api
end # end of module Webceo
