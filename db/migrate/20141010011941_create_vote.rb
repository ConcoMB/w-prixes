class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :nominee
      t.references :category
    end
  end
end
