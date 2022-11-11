class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
