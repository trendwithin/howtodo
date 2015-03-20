class Theme < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 4 }

  has_many :steps, dependent: :destroy
end
