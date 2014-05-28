guard :shell do
  watch(%r{^src/.+\.coffee$}) { `echo "Building...\n" && bundle exec ruby build.rb && echo "Done.\n"` }
end
