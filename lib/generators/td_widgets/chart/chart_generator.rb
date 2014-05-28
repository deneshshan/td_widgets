require 'pry'
module TdWidgets
  module Generators
    class ChartGenerator < Rails::Generators::Base
      include PathsHelper
      include FileHelper

      source_root File.expand_path('../templates', __FILE__)

      class_option :add_assets, :type => :boolean, :default => false, :aliases => '-a', :desc => 'Set to true to add require statements to application.js and app.js. These statements need to be added in order for charts to work'

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

      def copy_assets
        puts "Copying assets..."
        copy_file '../../../../../vendor/assets/javascripts/chart/angular-charts.min.js', get_vendor_assets_js_path + 'angular-charts.min.js'
        copy_file '../../../../../vendor/assets/javascripts/chart/d3.min.js', get_vendor_assets_js_path + 'd3.min.js' 
      end

      def clean_up_assets
        if options.add_assets
          puts "Cleaning up application.js..."
          clean_up_file "app/assets/javascripts/application.js", /^\/\/= require angular-charts.min$/
          clean_up_file "app/assets/javascripts/application.js", /^\/\/= require d3.min$/
          clean_up_file "app/assets/javascripts/app.js", /, \"angularCharts\"/
        end
      end

      def require_assets
        if options.add_assets
          puts "Requiring assets..."
          puts "Modifying app/assets/javascripts/application.js"
          inject_into_file "app/assets/javascripts/application.js", "\n//= require angular-charts.min\n", :after => "//= require ui-bootstrap-custom-0.5.0\n"
          inject_into_file "app/assets/javascripts/application.js", "//= require d3.min\n", :after => "//= require angular-charts.min\n"
          inject_into_file "app/assets/javascripts/app.js", ", \"angularCharts\"", :after => ", \"ui.bootstrap\""
        end
      end

      def print_require_assets_helper_text
        unless options.add_assets
          print_borders
          puts "The following lines will have to be added to the app/assets/javascripts/applications.js\n\n"
          puts "//= require angular-charts.min\n//= require d3.min"
          print_borders
        end
      end

      def show_require_assets_dependecy_helper_text
        unless options.add_assets
          print_borders
          puts "angularCharts should be added as a dependency of the application in app/assets/javascripts/app.js\n\n"
          puts "Add it as follows:\n\n"
          puts "Change: var app = angular.module(\"TeamDashboard\", [\"ngResource\", \"ngSanitize\", \"ngRoute\", \"ui.bootstrap\"]);\n"
          puts "to: var app = angular.module(\"TeamDashboard\", [\"ngResource\", \"ngSanitize\", \"ngRoute\", \"ui.bootstrap\", \"angularCharts\"]);\n\n"
          puts "Run with flag -a true, to do this through the generator"
          print_borders
        end
      end

      private

      def print_borders
          puts "\n"
          puts "******************************************************************************************\n\n"
      end

    end
  end
end
