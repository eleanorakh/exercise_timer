class WorkoutSession
  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attribute :sets, Integer

  validates :sets, presence: true

  def persisted?
    false
  end
end
