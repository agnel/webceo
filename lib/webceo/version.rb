# frozen_string_literal: true

module Webceo
  # Returns the version of the currently loaded Rails as a <tt>Gem::Version</tt>
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY  = 0
    PRE   = nil # 'alpha', 'beta', 'rc1', 'rc2', nil

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
  end
end
