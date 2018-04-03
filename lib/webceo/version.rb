# frozen_string_literal: true

module Webceo
  #
  # Returns the version of the currently loaded Webceo as a <tt>Gem::Version</tt>
  #
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  #
  # Module VERSION provides constants as per the semantic versioning specification
  #
  # @see https://semver.org/
  #
  # @author Agnel Waghela <agnelwaghela@gmail.com>
  #
  module VERSION
    MAJOR = 1
    MINOR = 0
    PATCH = 0
    PRE   = nil # 'alpha', 'beta', 'rc1', 'rc2', nil

    STRING = [MAJOR, MINOR, PATCH, PRE].compact.join(".")
  end
end
