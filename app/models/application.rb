class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job

  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }
end
