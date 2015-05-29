class CreateJudgements < ActiveRecord::Migration
  def change
    create_table :judgements do |t|
      t.references :user
      t.references :kitten
      t.boolean :is_meow

      t.timestamps
    end
  end
end
