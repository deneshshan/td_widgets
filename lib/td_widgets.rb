require "td_widgets/engine"

module TdWidgets
  module PathsHelper
    def get_assets_location
      '../../../../../app/assets/javascripts/'
    end
    
    def get_assets_path
      Rails.root.join('app', 'assets', 'javascripts')
    end
    
    def get_shared_sources_location
      '../../shared/templates/sources/source_type'
    end
    
    def get_sources_path
      Rails.root.join('app', 'models', 'sources')
    end
  end
end
