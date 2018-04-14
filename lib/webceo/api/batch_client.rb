module Webceo
  module Api
    class BatchClient < Client

      attr_reader :request_id
      attr_accessor :requests, :result

      @request_id = 0

      def initialize
        @requests = []
        @result = nil
      end

      def self.next_identifier
        @request_id += 1
      end

      def method_missing(method_name, data = {})
        data[:id] = self.class.next_identifier
        self.requests << Webceo::Api::Request.new(method_name, data)
      end

      def make_request
        self.result = self.class.post('/', body: self.requests.to_json)

        if self.result.code >= 500
          raise Webceo::Api::ServerError.new(self.result.code, self.result.body)
        end

        if self.result.code >= 400
          raise Webceo::Api::ClientError.new(self.result.code, self.result.body)
        end

        process_request_result
      end

      def process_request_result
        if self.result
          begin
            response_body = ::MultiJson.load(self.result.body, :symbolize_keys => true)
            if response_body.is_a?(Array)
              response_body.map do |response|
                error = check_for_response_errors(response)
                if error
                  error
                else
                  response
                end
              end
            else
              response_body
            end
          rescue ::MultiJson::ParseError => e
            e.cause
          end
        end
      end

      def check_for_response_errors(response)
        if response
          if response[:result] && response[:result] != 0
            if response[:result] == 500
              Webceo::Api::ServerError.new(self.result.code, response)
            else
              Webceo::Api::ClientError.new(self.result.code, response)
            end
          end
        end
      end

    end # end of class BatchClient
  end # end of module Api
end # end of module Webceo
