require 'pry'

module TdWidgets
  module Generators
    class SourceGenerator < Rails::Generators::NamedBase
      include SourcesHelper

      source_root File.expand_path('../templates/source_type', __FILE__)
      
      class_option :inc_base, :aliases => '-b', :default => :true, :desc => 'Generates base class for source'

      def create_base
        invoke("td_widgets:shared_sources", ["--source-type=#{options.source_type}"]) if options.inc_base
      end

      def create_source
        return unless validate_source_type 

        puts 'Creating source....'
         
        template "source.rb", get_source_folder_path("#{file_name}.rb") 
      end
    end
  end
end
