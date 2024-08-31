class CreateMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :media do |t|
      t.text :name
      t.date :release_date
      t.integer :type
      t.integer :platform
      t.string :link
      t.text :thoughts
      t.date :date_started
      t.date :date_completed
      t.integer :progress

      t.timestamps
    end
  end
end
