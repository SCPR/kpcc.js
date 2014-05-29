guard :shell do
  watch(%r{^src/.+\.coffee$}) { `echo "Building...\n" && rake build && echo "Done.\n"` }
end
