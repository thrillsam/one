# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  role            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
	has_secure_password
end
