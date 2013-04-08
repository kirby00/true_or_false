class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.text :question
      t.boolean :answer

      t.timestamps
    end
  end
end
