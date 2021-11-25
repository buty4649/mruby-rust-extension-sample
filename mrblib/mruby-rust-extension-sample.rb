def __main__(argv)
  if argv[1] == "version"
    puts "v#{MrubyRustExtensionSample::VERSION}"
  else
    Rust.func
  end
end
