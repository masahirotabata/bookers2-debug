class RemoveTopicIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :topic_id, :integer
  end
end
