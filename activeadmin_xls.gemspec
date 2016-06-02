$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'activeadmin_xls/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'activeadmin_xls'
  s.version     = ActiveadminXls::VERSION
  s.authors     = ['Armand Niampa']
  s.email       = ['armand.niampa@gmail.com']
  s.summary     = 'Axlsx active admin gem'
  s.description = 'Axlsx active admin gem'
  s.homepage    = 'https://github.com/ayann/activeadmin_xls'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.1.5'
  s.add_dependency 'axlsx'

  s.add_development_dependency 'sqlite3'
end
