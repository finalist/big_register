# -*- encoding: utf-8 -*-
require File.expand_path('../lib/big_register/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'big_register'
  gem.version       = BIGRegister::VERSION
  gem.date          = '2013-02-19'
  gem.summary       = "A gem to query the BIG register"
  gem.description   = "A gem to query the BIG register"
  gem.authors       = ["Arie"]
  gem.email         = 'rubygems@ariekanarie.nl'
  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.homepage      = 'http://github.com/finalist/big_register'

  gem.add_dependency "savon",          "~> 2.1.0"

  gem.add_development_dependency "pry-nav",        "~> 0.2.3"
  gem.add_development_dependency "rspec",          "~> 2.12.0"
  gem.add_development_dependency "spec_coverage",  "~> 0.0.5"
  gem.add_development_dependency "vcr",            "~> 2.4.0"
  gem.add_development_dependency "webmock"
end
