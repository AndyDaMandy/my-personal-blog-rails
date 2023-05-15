class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :language
      t.string :framework
      t.text :about
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
