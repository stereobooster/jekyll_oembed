# oEmbed plugin for jekyll. Simple liquid tag

## Example
```liquid
  {% oembed http://vimeo.com/2696386 width=960 %}
```
## Installation

### Bundler
Add this line to your application's `Gemfile`:
```ruby
gem 'jekyll-oembed'
```

And then execute:
```bash
$ bundle
```

### Standalone
Execute:
```bash
$ gem install jekyll-oembed
```

## Usage

### With Bundler (recomended)
Create the following plugin in your projects _plugins directory.

```ruby
# _plugins/bundler.rb
require "rubygems"
require "bundler/setup"
Bundler.require(:default)
```

This will automatically require all of the gems specified in your Gemfile.

### Standalone
Create the following plugin in your projects _plugins directory.

```ruby
# _plugins/jekyll-oembed-plugin.rb
require 'jekyll-oembed'
```
## Resources
 - [oEmbed providers](http://www.oembed.com/#section7.1)

## TODO
 - add support of passing API key for embedly
 - cache results (or not?)

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
