# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'fileutils'

module FetchCli
  module Api
    class Fetch
      def initialize(webpage)
        @webpage = webpage
        @uri = URI.parse(webpage)
      end

      def call
        File.open(file_name, 'w') do |f|
          f.write(response.body)
        end
        say "Webpage #{webpage} downloaded in #{file_name}"
        Webpage.record(webpage, uri.hostname, response.body)
      rescue Exception => e
        puts "Failed to download webpage: #{webpage}"
        puts "Error: #{e.message}"
      end

      private

      attr_accessor :webpage, :uri

      def file_name
        "#{uri.hostname}.html"
      end

      def response
        Net::HTTP.get_response(uri)
      end
    end
  end
end
