class CreateTqaCategories < ActiveRecord::Migration
  def change
    create_table :tqa_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
