$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "td_widgets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "td_widgets"
  s.version     = TdWidgets::VERSION
  s.authors     = ["Denesh Shan"]
  s.email       = ["denesh.shan@outlook.com"]
  s.homepage    = "https://github.com/deneshshan/td_widgets"
  s.summary     = "A collection of widgets for Team Dashboard."
  s.description = "A collection of widgets for Team Dashboard."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
