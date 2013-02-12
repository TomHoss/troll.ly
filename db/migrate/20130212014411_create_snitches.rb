class CreateSnitches < ActiveRecord::Migration
  def self.up
    create_table :snitches do |t|
      t.string :youtube_url

      t.timestamps
    end
  end

  def self.down
    drop_table :snitches
  end
end
