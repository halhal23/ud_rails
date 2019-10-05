# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  board_id   :integer
#  name       :string(255)
#  comment    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
