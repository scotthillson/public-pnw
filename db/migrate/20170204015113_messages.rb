class Messages < ActiveRecord::Migration
  def change
    create_table :messages, force: true do |t|
      t.string   :sid
      t.datetime :date_created
      t.datetime :date_updated
      t.datetime :date_sent
      t.string   :account
      t.string   :messaging_service_sid
      t.string   :from
      t.string   :to
      t.string   :body
      t.string   :num_media
      t.string   :num_segments
      t.string   :status
      t.string   :error_code
      t.string   :error_message
      t.string   :direction
      t.string   :price
      t.string   :price_unit
      t.string   :api_version
      t.string   :uri
      t.string   :subresource_uri
    end
  end
  drop_table :vacations
end
