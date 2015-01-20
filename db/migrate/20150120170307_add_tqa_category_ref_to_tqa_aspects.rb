class AddTqaCategoryRefToTqaAspects < ActiveRecord::Migration
  def change
    add_reference :tqa_aspects, :tqa_category, index: true
  end
end
