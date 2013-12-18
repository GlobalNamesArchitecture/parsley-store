# coding: utf-8
require_relative 'lib/parsley-store/version'

Gem::Specification.new do |sp|
  sp.name          = 'parsley-store'
  sp.version       = ParsleyStore::VERSION
  sp.authors       = ['Dmitry Mozzherin']
  sp.email         = ['dmozzherin@gmail.com']
  sp.description   = %q{Scientific Names Parser with Cached Results}
  sp.summary       = %q{Scientific names parser/atomizer with cached
                        distributed storage of atomized data}
  sp.homepage      = 'https://github.com/GlobalNamesArchitecture/parsley-store'
  sp.license       = 'MIT'

  sp.files         = `git ls-files`.split($/)
  sp.test_files    = sp.files.grep(%r{^(spec|features)/})
  sp.require_paths = ['lib']
  
  sp.add_runtime_dependency 'biodiversity', '~> 3.1'
  sp.add_runtime_dependency 'redis', '~> 3.0'

  sp.add_development_dependency 'rake', '~> 10.1'
  sp.add_development_dependency 'rspec', '~> 2.14'
  sp.add_development_dependency 'cucumber', '~> 1.3'
  sp.add_development_dependency 'coveralls', '~> 0.7'
end
