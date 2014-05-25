module TdWidgets
  module Generators
    class SharedSourcesGenerator < Rails::Generators::Base
      include SourcesHelper

      source_root File.expand_path('../templates/sources/source_type', __FILE__)

      def create_base
        return unless validate_source_type
        puts "Creating base source for #{ options.source_type } ...."
        template "base.rb.tt", get_source_folder_path("base.rb")  
      end
    end
  end
end
