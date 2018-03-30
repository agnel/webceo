module Webceo

  API_METHODS = YAML.load_file('./lib/webceo/api_methods.yml')

  #
  # Module Api provides Constants and Classes for accessing the Webceo API
  #
  # @author Agnel Waghela <agnelwaghela@gmail.com>
  #
  module Api

    #
    # These are the response codes as mentioned on the API Reference
    #
    # 0 Request successfully processed
    # 1 Bad request
    # 4 Not found
    # 5 Bad arguments
    # 6 Access denied
    # 10  Unknown command (method)
    # 11  Scanning
    # 12  Not configured
    # 15  Email address has already been used to create a user account.
    # 100 Site not available
    # 403 Forbidden
    # 500 Server Error (contact support if you get this response code)
    #
    # @see https://online.webceo.com/help-center/api-site/response-codes.html
    #
    RESPONSE_CODES = [0, 1, 4, 5, 6, 10, 11, 12, 15, 100, 403, 500]
  end # end of module Api
end # end of module Webceo
