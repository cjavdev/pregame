# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string
#  session_token   :string           not null
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at     (deleted_at)
#  index_users_on_email          (email)
#  index_users_on_session_token  (session_token)
#

class User < ApplicationRecord
  has_many :ideas
end
