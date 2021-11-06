class AddFollowingToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :following, :string
  end
end
