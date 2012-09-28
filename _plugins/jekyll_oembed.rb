# jekyll_oembed 0.0.1
# https://github.com/stereobooster/jekyll_oembed

begin
  require 'oembed'
  require 'shellwords'

  module Jekyll
    class OEmbedTag < Liquid::Tag

      def initialize(tag_name, text, tokens)
        super
        @params = text.shellsplit
        @url = @params.shift
        @params = Hash[*@params.map{|val| val.split('=')}.flatten]
      end

      def render(context)
        OEmbed::Providers.register(OEmbed::Providers::Youtube)
        OEmbed::Providers.register(OEmbed::Providers::Vimeo)
        begin
          resource = OEmbed::Providers.get(@url, @params)
          # TODO: cache results
          # resource.type
          # resource.provider.name
          # resource.video?
          # resource.thumbnail_url
          resource.html
        rescue OEmbed::NotFound
          warn "No embeddable content at #{@url}"
          "<a href='#{@url}'>#{@url}</a>"
        end
      end
    end
  end

  Liquid::Template.register_tag('oembed', Jekyll::OEmbedTag)
rescue LoadError
  warn "Install oembed gem: gem install oembed or add it to Gemfile"
end