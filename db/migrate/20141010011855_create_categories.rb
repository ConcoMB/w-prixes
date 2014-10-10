class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :description
      t.string :title
      t.boolean :is_closed_to_nominate, default: false
    end
  end
end
