class TqaAspect < ActiveRecord::Base
  belongs_to :tqa_category

  validates :name, uniqueness: true
  validates :percent_run, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
  validates :percent_pass, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
  validates :tqa_category_id, presence: true
end
