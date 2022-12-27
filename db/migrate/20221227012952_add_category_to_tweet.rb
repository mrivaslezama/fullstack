class AddCategoryToTweet < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweets, :category, null: false, foreign_key: true
  end
end
