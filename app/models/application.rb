class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job
  accepts_nested_attributes_for :job, allow_destroy: true

  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }
end
