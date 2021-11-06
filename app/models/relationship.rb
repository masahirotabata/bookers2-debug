class Relationship < ApplicationRecord
  
     belongs_to :follower, class_name: "User"
     belongs_to :followed, class_name: "User"
     belongs_to :following, class_name: "User",optional: true
     
     belongs_to :user, optional: true
     belongs_to :book,optional: true

end
