# == Schema Information
#
# Table name: personas
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  profile    :text
#  goals      :string
#  industry   :string
#  user_id    :bigint(8)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_personas_on_deleted_at  (deleted_at)
#  index_personas_on_user_id     (user_id)
#

class Persona < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  before_validation(on: :create) do
    self.name ||= Faker::Name.name
  end
end
