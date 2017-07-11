class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

end

# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
