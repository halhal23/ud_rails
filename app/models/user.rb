# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

class User < ApplicationRecord
  has_secure_password
  
  validates :name,
    presence: true,
    length: { maximum: 16 },
    uniqueness: true,
    format: {
      with: /\A[a-z0-9]+\z/,
      message: 'フォーマットが正しくありません。'
    }

  validates :password,
    length: { minimum: 8 }
end
