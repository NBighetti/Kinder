class CreateKittens < ActiveRecord::Migration
  def change
  create_table :kittens do |t|
    t.string :url, null: false
    end
  end
end
