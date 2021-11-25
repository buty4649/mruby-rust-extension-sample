MRuby::Gem::Specification.new('rust-extension') do |spec|
  spec.license = 'MIT'
  spec.author  = 'buty4649'
  spec.summary = 'Rust in mruby'

  cargo_dir = File.dirname(__FILE__)
  cargo_target_dir = File.join(build_dir, "target")

  FileUtils.mkdir_p(build_dir)
  Dir.chdir(cargo_dir) do
    `cargo build --release --target-dir "#{cargo_target_dir}"`
    fail "cargo build failed" unless $?.success?
  end

  library_name = "lib#{funcname}.a"
  library_file = File.join(cargo_target_dir, "release", library_name)
  spec.objs << library_file
  spec.linker.flags_before_libraries << library_file
end
