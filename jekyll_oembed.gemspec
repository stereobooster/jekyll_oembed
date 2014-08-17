# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "jekyll-oembed"
  gem.version       = '0.0.1'
  gem.authors       = ["stereobooster"]
  gem.email         = ["stereobooster@gmail.com"]
  gem.description   = %q{Provides an oembed liquid tag for Jekyll}
  gem.summary       = %q{Provides an oembed liquid tag for Jekyll}
  gem.homepage      = "https://github.com/stereobooster/jekyll_oembed"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "jekyll"
  gem.add_dependency "ruby-oembed", "~> 0.8.8"

  gem.add_development_dependency "rake"

end
