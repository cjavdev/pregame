# == Schema Information
#
# Table name: ideas
#
#  id                      :bigint(8)        not null, primary key
#  theory                  :string           not null
#  question                :string
#  answers                 :string
#  customer_location       :string
#  user_id                 :bigint(8)
#  estimated_arpa_cents    :integer          default(0), not null
#  estimated_arpa_currency :string           default("USD"), not null
#  deleted_at              :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  competition             :text
#  public                  :boolean          default(FALSE)
#
# Indexes
#
#  index_ideas_on_deleted_at  (deleted_at)
#  index_ideas_on_user_id     (user_id)
#

class Idea < ApplicationRecord
  belongs_to :user
end
