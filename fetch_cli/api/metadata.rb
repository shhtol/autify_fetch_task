# frozen_string_literal: true

module FetchCli
  module Api
    class Metadata
      def initialize(webpage)
        @webpage = Webpage.find_by(name: webpage)
      end

      def call
        return no_fetched_response if webpage.nil?

        html_content
      end

      private

      attr_accessor :webpage

      def no_fetched_response
        puts "Html content haven't fetched yet"
      end

      def html_content
        puts "site: #{webpage.host}"
        puts "num_links: #{webpage.num_links}"
        puts "images: #{webpage.images}"
        puts "last_fetch: #{webpage.last_fetch}"
      end
    end
  end
end
