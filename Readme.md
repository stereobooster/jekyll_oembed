# oEmbed plugin for jekyll. Simple liquid tag

## Example
```liquid
  {% oembed http://vimeo.com/2696386 width=960 %}
```

## Usage
 - add `gem 'jekyll_oembed'` to your Gemfile
 - add `require 'jekyll_oembed'` to the file `_plugins/ext.rb`
 - install gems: `bundle`
 - regenerate all content: `bundle exec jekyll`

## Resources
 - [oEmbed providers](http://www.oembed.com/#section7.1)

## TODO
 - add support of passing API key for embedly
 - cache results (or not?)
