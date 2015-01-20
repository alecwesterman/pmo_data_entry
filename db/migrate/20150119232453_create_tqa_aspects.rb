class CreateTqaAspects < ActiveRecord::Migration
  def change
    create_table :tqa_aspects do |t|
      t.string :name
      t.float :percent_run
      t.float :percent_pass

      t.timestamps
    end
  end
end
