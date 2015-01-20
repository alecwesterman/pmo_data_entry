class TqaAspect < ActiveRecord::Base
  belongs_to :tqa_category

  validates :name, uniqueness: true
  validates :percent_run, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
  validates :percent_pass, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
  validates :tqa_category_id, presence: true

  def portion_failed_testing
    100-portion_passed_testing-portion_to_be_tested
  end
  def portion_passed_testing
    (self.percent_run)*(self.percent_pass)/100
  end
  def portion_to_be_tested
    100-self.percent_run
  end
end
