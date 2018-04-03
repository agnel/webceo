module Webceo
  #
  # Class Configuration provides ability to set webceo specific configurations
  #
  # @author Agnel Waghela <agnelwaghela@gmail.com>
  #
  class Configuration

    #
    # @!attribute [rw] api_key
    #   @return [String] API Key required to be present along with the api request
    attr_accessor :api_key

    #
    # Initialize default attribute values
    #
    #
    def initialize
      @api_key = nil
    end
  end # end of class Configuration
end # end of module Webceo
