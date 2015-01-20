class TqaCategory < ActiveRecord::Base
  has_many:tqa_aspects

  validates :name, uniqueness: true
end
