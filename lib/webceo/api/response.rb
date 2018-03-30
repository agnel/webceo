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
        info = MultiJson.load(self.body).first

        if info['result'] && info['result'] != 0
          if info['result'] == 500
            raise Webceo::Api::ServerError.new(self.status.to_i, self.body)
          else
            raise Webceo::Api::ClientError.new(self.status.to_i, self.body)
          end
        end
      end
    end # end of class Response
  end # end of module Api
end # end of module Webceo
