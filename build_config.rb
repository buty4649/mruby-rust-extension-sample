def gem_config(conf)
  #conf.gembox 'default'

  # be sure to include this gem (the cli app)
  conf.gem File.expand_path(File.dirname(__FILE__))
end

MRuby::Build.new do |conf|
  conf.toolchain

  conf.enable_bintest
  conf.enable_debug
  conf.enable_test

  gem_config(conf)
end

