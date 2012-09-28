# oEmbed plugin for jekyll. Simple liquid tag

## Example
```liquid
  {% oembed http://vimeo.com/2696386 width=960 %}
```

## Usage
 - put `jekyll_oembed.rb` in plugins folder
 - add gems to `Gemfile`
 - install gems: `bundle`
 - regenerate all content: `bundle exec jekyll` 

## Resources
 - [oEmbed providers](http://www.oembed.com/#section7.1)

## TODO
 - add support of passing API key for embedly
 - cache results (or not?)
