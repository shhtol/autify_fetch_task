# frozen_string_literal: true

require 'active_record'

class Webpage < ActiveRecord::Base
  validates :name, :last_fetch, presence: true

  def self.record(name, hostname, body = '')
    webpage = Webpage.find_or_create_by(name: name)
    num_links = body.scan(/<a/).count
    images = body.scan(/<img/).count
    webpage.update(host: hostname, num_links: num_links, images: images, last_fetch: Time.now)
  end
end
