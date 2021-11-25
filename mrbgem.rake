require_relative 'mrblib/mruby-rust-extension-sample/version'

spec = MRuby::Gem::Specification.new('mruby-rust-extension-sample') do |spec|
  spec.bins    = ['mruby-rust-extension-sample']
  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
  spec.add_dependency 'rust-extension', :path => '../mrbgems/rust-extension'
end

spec.license = 'MIT'
spec.author  = 'MRuby Developer'
spec.summary = 'mruby-rust-extension-sample'
spec.version = MrubyRustExtensionSample::VERSION
