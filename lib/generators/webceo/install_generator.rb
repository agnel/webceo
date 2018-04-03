# frozen_string_literal: true

require 'rails/generators/base'

module Webceo
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc 'Creates a Webceo initializer for your application'

      def copy_initializer
        template "webceo.rb", "config/initializers/webceo.rb"

        puts "Install complete!"
      end
    end
  end
end
