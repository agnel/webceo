require 'webceo/version'

require 'httparty'
require 'multi_json'
require 'active_support/core_ext/hash/indifferent_access'
require 'webceo/api'
require 'webceo/configuration'

module Webceo

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Webceo::Configuration.new
    yield(configuration)
  end

  def self.reset
    self.configuration = Webceo::Configuration.new
  end

end # end of module Webceo
