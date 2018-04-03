module Webceo
  module Api
    #
    # Class Error provides customized error message based on the response sent by
    # Webceo API server
    #
    # @author Agnel Waghela <agnelwaghela@gmail.com>
    #
    class Error < StandardError

      attr_accessor :http_status, :response_body, :code, :message, :api_method, :request_id

      def initialize(http_status, response_body, error_info = nil)
        self.response_body = (response_body) ? response_body.strip : ''
        self.http_status = http_status

        if error_info && error_info.is_a?(String)
          message = error_info
        else
          unless error_info
            begin
              error_info = MultiJson.load(response_body).first if response_body
            rescue
            end
            error_info ||= {}
          end

          error_info = error_info.with_indifferent_access

          self.code = error_info['result']
          self.message = error_info['errormsg']
          self.api_method = error_info['method']
          self.request_id = error_info['id']

          error_array = []
          %i(code message api_method request_id).each do |key|
            error_array << "#{key}: #{self.send(key)}" if self.send(key)
          end

          if error_array.empty?
            message = self.response_body
          else
            message = error_array.join(', ')
          end
        end
        message += " [HTTP #{http_status}]" if http_status

        super(message)
      end
    end # end of class Error

    #
    # Class ServerError provides indication to user that its a server error
    #
    # @author Agnel Waghela <agnelwaghela@gmail.com>
    #
    class ServerError < Error; end

    #
    # Class ClientError provides indication to user that its a client error
    #
    # @author Agnel Waghela <agnelwaghela@gmail.com>
    #
    class ClientError < Error; end
  end # end of module Api
end # end of module Webceo
