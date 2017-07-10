class Tweet < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: { maximum: 140, message: 'Max tweet length is 140 characters' }
  validates :user_id, presence: { message: 'Invalid user id' }
  validates :user, presence: { message: 'must exist!' }
end

# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  message    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
