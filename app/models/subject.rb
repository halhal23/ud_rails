# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :text(65535)
#  detail     :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ApplicationRecord
end
