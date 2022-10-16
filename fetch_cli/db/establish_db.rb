# frozen_string_literal: true
#
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.db')
class CreateWebpages < ActiveRecord::Migration[7.0]
  def change
    create_table :webpages do |table|
      table.string :host
      table.string :name
      table.integer :num_links
      table.integer :images
      table.datetime :last_fetch
      table.timestamps
    end
  end
end
CreateWebpages.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:webpages)