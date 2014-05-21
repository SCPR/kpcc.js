require 'uglifier'
require 'coffee_script'

version = File.read("VERSION").chomp

files = %w[
  src/kpcc.coffee
  src/kpcc/entity.coffee
  src/kpcc/api_entity.coffee

  src/kpcc/abstract.coffee
  src/kpcc/alert.coffee
  src/kpcc/article.coffee
  src/kpcc/asset.coffee
  src/kpcc/attribution.coffee
  src/kpcc/audio.coffee
  src/kpcc/blog.coffee
  src/kpcc/bucket.coffee
  src/kpcc/category.coffee
  src/kpcc/data_point.coffee
  src/kpcc/edition.coffee
  src/kpcc/episode.coffee
  src/kpcc/event.coffee
  src/kpcc/location.coffee
  src/kpcc/program.coffee
  src/kpcc/schedule_occurrence.coffee
  src/kpcc/sponsor.coffee
]

coffee = Tempfile.new("coffee")

begin
  files.each do |file|
    coffee.write File.read(file)
  end

  coffee.rewind

  js = CoffeeScript.compile(coffee.read)

  File.open("development/kpcc-dev.js", "w") do |f|
    f.write(js)
  end

  minified = Uglifier.compile(js)
ensure
  coffee.close
  coffee.unlink
end

File.open("releases/kpcc-#{version}.min.js", "w") do |f|
  f.write minified
end
