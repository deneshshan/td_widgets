module TdWidgets
  module Generators
    class ChartGenerator < Rails::Generators::Base
      include TdWidgets::PathsHelper

      source_root File.expand_path('../templates', __FILE__)

      def copy_widget_assets
        puts "Creating widget assets..."
        directory self.get_assets_location + "widgets/chart/", self.get_assets_path + "widgets/chart/"
      end

      def copy_widget_templates
        puts "Createing widget templates..."
        directory self.get_assets_location + "templates/widgets/chart/", self.get_assets_path + "templates/widgets/chart/"
      end

      def copy_sources
        puts "Creating sources...."
        directory self.get_shared_sources_location , self.get_sources_path + "chart/"
      end
    end
  end
end
