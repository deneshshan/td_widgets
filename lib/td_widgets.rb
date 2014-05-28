require "td_widgets/engine"

module TdWidgets
  module PathsHelper
    def get_assets_location
      'javascripts/'
    end
    
    def get_assets_path
      Rails.root.join('app', 'assets', 'javascripts')
    end
    
    def get_shared_sources_location
      '../../shared/templates/sources/source_type/'
    end
    
    def get_sources_path
      Rails.root.join('app', 'models', 'sources')
    end

    def get_vendor_assets_js_path
      Rails.root.join('vendor', 'assets', 'javascripts')
    end
  end

  module SourcesHelper
    extend ActiveSupport::Concern

    included do
      class_option :source_type, :required => :true, :type => :string, :desc => 'The source type to be used for this source. This is the widget folder name under models/sources to place this file in.'
    end

    protected

    def get_source_folder_path(file_name_with_ext = "")
      Rails.root.join('app', 'models', 'sources', options.source_type, file_name_with_ext)
    end

    def validate_source_type
      valid = Sources.available_source_types.include?(options.source_type)
      puts "\nInvalid source type!\nSource types available: " + Sources.available_source_types.to_s + "\n\n" unless valid
      valid
    end
  end

  module FileHelper
    def clean_up_file(path, regex)
      gsub_file path, regex, ""
    end
  end
end
