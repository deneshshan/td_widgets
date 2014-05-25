require 'pry'
module TdWidgets
  module Generators
    class ChartGenerator < Rails::Generators::Base
      include TdWidgets::PathsHelper

      source_root File.expand_path('../templates', __FILE__)

      def create_widget_assets
        puts "Creating widget assets..."
        directory self.get_assets_location + "widgets/chart/", self.get_assets_path + "widgets/chart/"
      end

      def create_widget_templates
        puts "Creating widget templates..."
        directory self.get_assets_location + "templates/widgets/chart/", self.get_assets_path + "templates/widgets/chart/"
      end

      def create_base
        puts "Creating base source..."
        Rails::Generators.invoke("td_widgets:shared_sources", ["--source-type=chart"])
      end

      def create_demo
        puts "Creating demo source..."
        copy_file "sources/demo.rb", get_sources_path + "chart/demo.rb"
      end
    end
  end
end
