class CreateConverts < ActiveRecord::Migration[6.0]
  def change
    create_table :converts do |t|
      t.string :long_url
      t.string :url_endpoint
      t.string :new_url

      t.timestamps
    end
  end
end
