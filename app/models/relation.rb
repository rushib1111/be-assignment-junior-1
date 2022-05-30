class Relation < ApplicationRecord
  belongs_to :user, :foreign_key => :friend_id
end
