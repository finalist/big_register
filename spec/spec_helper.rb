require 'pry-nav'
require "big_register"
require 'vcr'
require 'webmock'

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
