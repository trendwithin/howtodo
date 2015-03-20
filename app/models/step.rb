class Step < ActiveRecord::Base
  validates :step, presence: true

  belongs_to :theme
end
