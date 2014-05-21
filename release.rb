ENV['RELEASE'] = "true"

print "Version (plain): "
version = gets.chomp

# Update VERSION
File.open("VERSION", "w") { |f| f.write(version) }

load "build.rb"
