#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rubygems'
require 'commander/import'

require './fetch_cli/api/fetch'
require './fetch_cli/api/metadata'
require './fetch_cli/models/webpage'
require './fetch_cli/db/establish_db'

program :name, 'autify_fetch_task'
program :version, '0.0.1'
program :description, 'Backend Engineer Take Home Test'

command :fetch do |c|
  c.syntax = 'fetch'
  c.description = 'Download Webpages'
  c.option '--metadata STRING', String, 'Get Webpage metadata'
  c.action do |args, options|
    options.default metadata: nil
    if options.metadata.present?
      FetchCli::Api::Metadata.new(options.metadata).call
    else
      args.each do |arg|
        FetchCli::Api::Fetch.new(arg).call
      end
    end
  end
end

default_command :fetch
