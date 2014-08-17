require 'oembed'
require 'shellwords'
require 'digest/md5'

OEmbed::Providers.register_all
OEmbed::Providers::Youtube.endpoint += "?scheme=https"

module Jekyll
  class OEmbedTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
      @cache_dir = '/tmp'
    end

    def render(context)
      text = Liquid::Template.parse(@text).render context

      if val = cache_get(text)
        return val
      end

      params = text.shellsplit
      url = params.shift
      params = Hash[*params.map{|val| val.split('=')}.flatten]

      resource = OEmbed::Providers.get(url, params)
      html = resource.html

      if url =~ /:\/\/(www.youtube.com|youtu.be)\//
        %w{width height}.each do |name|
          if params[name]
            html.gsub! Regexp.new(name+'="\\d+'), name+'="'+params[name]
          end
         end
      end

      # resource.video?, resource.thumbnail_url
      cache_set text, "<div class='oembed #{resource.type}'>#{html}</div>"

    rescue OEmbed::NotFound
      warn "No embeddable content at #{url}"
      "<a href='#{url}'>#{url}</a>"
    end

    private

    def cache_path input
      File.join '', @cache_dir, "oembed-#{Digest::MD5.hexdigest(input)}"
    end

    def cache_get input
      max_age = 60 * 60 * 24
      file_path = cache_path input
      if File.exists?(file_path) && (Time.now - File.mtime(file_path) < max_age)
        return File.new(file_path).read
      end
    end

    def cache_set input, result
      File.open(cache_path(input), 'w') { |file| file << result }
      result
    end
  end
end

Liquid::Template.register_tag('oembed', Jekyll::OEmbedTag)
