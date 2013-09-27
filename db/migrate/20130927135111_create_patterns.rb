class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :content
      t.string :guess_state

      t.timestamps
    end
  end
end
