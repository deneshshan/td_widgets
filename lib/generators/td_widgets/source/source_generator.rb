module TdWidgets
  class SourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)
  
    class_option :source_type, :type => :string, :required => :true, :desc => 'The source type to be used for this source. This is the widget folder name under models/sources to place this file in.'

    def create_sources_folder
      if !validate_source_type
        puts "\nInvalid source type!\nSource types available: " + Sources.available_source_types.to_s + "\n\n"
        return
      end
       
      template get_template_path("source.rb"), get_source_folder_path("#{file_name}.rb") 
    end

    private

    def get_template_path(file_name_with_ext = "")
      "../templates/source_type/#{file_name_with_ext}"
    end

    def get_source_folder_path(file_name_with_ext = "")
      Rails.root.join('app', 'models', 'sources', options.source_type, file_name_with_ext)
    end

    def validate_source_type
      Sources.available_source_types.include?(options.source_type)
    end
  end
end
