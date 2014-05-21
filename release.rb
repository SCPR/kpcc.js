ENV['RELEASE'] = "true"

print "Version (plain): "
version = gets.chomp

# Update VERSION
File.open("VERSION", "w") { |f| f.write(version) }

# Tag it
print "Tag? (Y/N): "
if gets.chomp == "Y"
  `git tag v#{version}`
end

load "build.rb"
